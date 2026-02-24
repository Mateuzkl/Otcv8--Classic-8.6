BUY = 1
SELL = 2
CURRENCY = 'gold'
CURRENCY_DECIMAL = false
WEIGHT_UNIT = 'oz'
LAST_INVENTORY = 10

npcWindow = nil
itemsPanel = nil
radioTabs = nil
radioItems = nil
searchText = nil
setupPanel = nil
quantity = nil
quantityScroll = nil
idLabel = nil
nameLabel = nil
priceLabel = nil
moneyLabel = nil
weightDesc = nil
weightLabel = nil
capacityDesc = nil
capacityLabel = nil
tradeButton = nil
buyTab = nil
sellTab = nil
initialized = false

showWeight = true
buyWithBackpack = nil
ignoreCapacity = nil
ignoreEquipped = nil
showAllItems = nil
sellAllButton = nil
sellAllWithDelayButton = nil
playerFreeCapacity = 0
playerMoney = 0
tradeItems = {}
playerItems = {}
selectedItem = nil

cancelNextRelease = nil

sellAllWithDelayEvent = nil

local isHalloween = false

local function resetAllWidgetOpacity(widget)
  if not widget then return end
  widget:setOpacity(1.0)
  for _, child in ipairs(widget:getChildren()) do
    resetAllWidgetOpacity(child)
  end
end


function init()
  npcWindow = g_ui.displayUI('npctrade')
  npcWindow:setVisible(false)

  itemsPanel = npcWindow:recursiveGetChildById('itemsPanel')
  searchText = npcWindow:recursiveGetChildById('searchText')

  setupPanel = npcWindow:recursiveGetChildById('setupPanel')
  quantityScroll = setupPanel:recursiveGetChildById('quantityScroll')
  idLabel = setupPanel:recursiveGetChildById('id')
  itemLabel = setupPanel:recursiveGetChildById('itemLabel')
  nameLabel = setupPanel:recursiveGetChildById('name')
  priceLabel = setupPanel:recursiveGetChildById('price')
  moneyLabel = setupPanel:recursiveGetChildById('money')
  weightDesc = setupPanel:recursiveGetChildById('weightDesc')
  weightLabel = setupPanel:recursiveGetChildById('weight')
  capacityDesc = setupPanel:recursiveGetChildById('capacityDesc')
  capacityLabel = setupPanel:recursiveGetChildById('capacity')
  tradeButton = npcWindow:recursiveGetChildById('tradeButton')

  buyWithBackpack = npcWindow:recursiveGetChildById('buyWithBackpack')
  ignoreCapacity = npcWindow:recursiveGetChildById('ignoreCapacity')
  ignoreEquipped = npcWindow:recursiveGetChildById('ignoreEquipped')
  showAllItems = npcWindow:recursiveGetChildById('showAllItems')
  sellAllButton = npcWindow:recursiveGetChildById('sellAllButton')
  sellAllWithDelayButton = npcWindow:recursiveGetChildById('sellAllWithDelayButton')
  buyTab = npcWindow:recursiveGetChildById('buyTab')
  sellTab = npcWindow:recursiveGetChildById('sellTab')

  radioTabs = UIRadioGroup.create()
  radioTabs:addWidget(buyTab)
  radioTabs:addWidget(sellTab)
  radioTabs:selectWidget(buyTab)
  radioTabs.onSelectionChange = onTradeTypeChange

  cancelNextRelease = false

  if g_game.isOnline() then
    playerFreeCapacity = g_game.getLocalPlayer():getFreeCapacity() * 100
  end

  connect(g_game, { onGameEnd = hide,
                    onOpenNpcTrade = onOpenNpcTrade,
                    onCloseNpcTrade = onCloseNpcTrade,
                    onPlayerGoods = onPlayerGoods } )

  connect(LocalPlayer, { onFreeCapacityChange = onFreeCapacityChange,
                         onInventoryChange = onInventoryChange } )

  initialized = true
  clearSelectedItem()
end

function terminate()
  initialized = false
  npcWindow:destroy()
  if confirmWindow then
  confirmWindow:destroy()
  end
  removeEvent(sellAllWithDelayEvent)
  
  disconnect(g_game, {  onGameEnd = hide,
                        onOpenNpcTrade = onOpenNpcTrade,
                        onCloseNpcTrade = onCloseNpcTrade,
                        onPlayerGoods = onPlayerGoods } )

  disconnect(LocalPlayer, { onFreeCapacityChange = onFreeCapacityChange,
                            onInventoryChange = onInventoryChange } )
end

function show()
  if g_game.isOnline() then
    if #tradeItems[BUY] > 0 then
      radioTabs:selectWidget(buyTab)
    else
      radioTabs:selectWidget(sellTab)
    end

    npcWindow:show()
    npcWindow:lock()
    npcWindow:raise()
    npcWindow:focus()
  end
end

function hide()
  removeEvent(sellAllWithDelayEvent)

  npcWindow:hide()

  local layout = itemsPanel:getLayout()
  layout:disableUpdates()

  clearSelectedItem()

  resetAllWidgetOpacity(npcWindow)

  searchText:clearText()
  setupPanel:disable()
  itemsPanel:destroyChildren()

  if radioItems then
    radioItems:destroy()
    radioItems = nil
  end

  layout:enableUpdates()
  layout:update()  
end

function onItemBoxChecked(widget)
  if widget:isChecked() then
    local item = widget.item
    selectedItem = item
    refreshItem(item)

    if getCurrentTradeType() == SELL then
      quantityScroll:setValue(quantityScroll:getMaximum())
    end
  end
end

function onQuantityValueChange(quantity)
  if selectedItem then
    weightLabel:setText(string.format('%.2f', selectedItem.weight*quantity) .. ' ' .. WEIGHT_UNIT)
    priceLabel:setText(formatCurrency(getItemPrice(selectedItem)))
  end
end

local selectedAmount = 0

function onTradeTypeChange(radioTabs, selected, deselected)
  currentTradeType = selected:getText()
  selected:setOn(true)
  deselected:setOn(false)
  local currentTradeType = getCurrentTradeType()
  -- buyWithBackpack:setVisible(currentTradeType == BUY)
  -- npcWindow:recursiveGetChildById('buyWithBackpackBackground'):setVisible(currentTradeType == BUY)
  -- ignoreCapacity:setVisible(currentTradeType == BUY)
  -- npcWindow:recursiveGetChildById('ignoreCapacityBackground'):setVisible(currentTradeType == BUY)
  -- showAllItems:setVisible(true)--(currentTradeType == SELL)
  -- npcWindow:recursiveGetChildById('showAllItemsBackground'):setVisible(currentTradeType == SELL)
  sellAllButton:setVisible(currentTradeType == SELL)
  -- ignoreEquipped:setVisible(currentTradeType == SELL)
  -- sellAllWithDelayButton:setVisible(currentTradeType == SELL)
  
  refreshTradeItems()
  refreshPlayerGoods()
  
  selectedAmount = 0
  quantityScroll:enable()
end

local confirmWindow

function onTradeClick()
  removeEvent(sellAllWithDelayEvent)
  if not selectedItem and (getCurrentTradeType() == BUY or selectedAmount == 0) then
    displayErrorBox("NPC Confirm trade", "You need to select an item.")
    return
  end

  if confirmWindow then
    confirmWindow:destroy() confirmWindow = nil
  end

  local  a, b, c, d
  
  if selectedItem then
    a = selectedItem.ptr
  end

  b, c, d = quantityScroll:getValue(), ignoreCapacity:isChecked(), buyWithBackpack:isChecked()
  
  local confirmTrade = function() 
    confirmWindow:destroy() confirmWindow = nil 
    if getCurrentTradeType() == SELL and selectedAmount > 0 then
      sellAll()
      return
    end
    
    if getCurrentTradeType() == BUY then
      b, c, d = quantityScroll:getValue(), ignoreCapacity:isChecked(), buyWithBackpack:isChecked()
      g_game.buyItem(a, b, c, d)
    else
      g_game.sellItem(a, b, c)
    end
  end

  local cancelFunc = function() confirmWindow:destroy() confirmWindow = nil end

  local message

  if getCurrentTradeType() == BUY then
    message = tr("Are you sure you want to buy it?")
  else
    if selectedAmount > 1 then
      message = tr("Are you sure you want to sell all selected items?") --TODO: Lock quantity horizontal scrollbar
    else
      message = tr("Are you sure you want to sell it?")
    end
  end

  confirmWindow = displayGeneralBox(tr('Confirm NPC trade'), message,
  { { text=tr('No'), callback=cancelFunc },
    { text=tr('Yes'), callback=confirmTrade },
    anchor=AnchorHorizontalCenter }, confirmTrade, cancelFunc)

end

function onSearchTextChange()
  refreshPlayerGoods()
end

local maxSelectableAmount = 0

local function select_to_sell_item(item)
  item.selected = true
  item:setImageColor("#3498DBCC") -- cor selecionado na caixa
  selectedAmount = selectedAmount + 1
  if selectedAmount > 1 then
    quantityScroll:disable()
  else
    quantityScroll:enable()
  end
  if maxSelectableAmount == selectedAmount then
    sellAllButton:setText("Unselect all")
  end
end

local function unselect_to_sell_item(item, ignore)
  item.selected = false
  item:setImageColor("white")
  selectedAmount = selectedAmount - 1
  
  if selectedAmount > 1 then
    quantityScroll:disable()
  else
    quantityScroll:enable()
  end
  sellAllButton:setText("Select all")
end

function itemPopup2(widget, mousePosition, mouseButton)
  itemPopup(widget:getChildById('item'), mousePosition, mouseButton)
end

function itemPopup(self, mousePosition, mouseButton)
  if cancelNextRelease then
    cancelNextRelease = false
    return false
  end

  if g_keyboard.isCtrlPressed() and getCurrentTradeType() == SELL then
    if not self:getParent().selected then
      select_to_sell_item(self:getParent())
    else
      unselect_to_sell_item(self:getParent())
    end
  elseif mouseButton == MouseRightButton then
    local menu = g_ui.createWidget('PopupMenu')
    menu:setGameMenu(true)
    menu:addOption(tr('Look'), function() return g_game.inspectNpcTrade(self:getItem()) end)
    if getCurrentTradeType() == SELL then
      if not self:getParent().selected then
        menu:addOption(tr('Select item to sell'), function() 
          select_to_sell_item(self:getParent())
        end)
      else
        menu:addOption(tr('Unselect item to sell'), function() 
          unselect_to_sell_item(self:getParent())
        end)
      end
    end
    menu:display(mousePosition)
    return true
  elseif ((g_mouse.isPressed(MouseLeftButton) and mouseButton == MouseRightButton)
    or (g_mouse.isPressed(MouseRightButton) and mouseButton == MouseLeftButton)) then
    cancelNextRelease = true
    g_game.inspectNpcTrade(self:getItem())
    return true
  end
  return false
end

function onBuyWithBackpackChange()
  if selectedItem then
    refreshItem(selectedItem)
  end
end

function onIgnoreCapacityChange()
  refreshPlayerGoods()
end

function onIgnoreEquippedChange()
  refreshPlayerGoods()
end

function onShowAllItemsChange()
  refreshPlayerGoods()
end

function setCurrency(currency, decimal)
  CURRENCY = currency
  CURRENCY_DECIMAL = decimal
end

function setShowWeight(state)
  showWeight = state
  weightDesc:setVisible(state)
  weightLabel:setVisible(state)
end

function setShowYourCapacity(state)
  capacityDesc:setVisible(state)
  capacityLabel:setVisible(state)
  ignoreCapacity:setVisible(state)
end

function clearSelectedItem()
  idLabel:clearText()
  nameLabel:clearText()
  itemLabel:setItemId(0)
  weightLabel:clearText()
  priceLabel:clearText()
  --tradeButton:disable()
  quantityScroll:setMinimum(0)
  quantityScroll:setMaximum(0)
  if selectedItem then
    radioItems:selectWidget(nil)
    selectedItem = nil
  end
end
currentTradeType = tr("Buy")
function getCurrentTradeType()
  if currentTradeType == tr('Buy') then
    return BUY
  else
    return SELL
  end
end

function getItemPrice(item, single)
  local amount = 1
  local single = single or false
  if not single then
    amount = quantityScroll:getValue()
  end
  if getCurrentTradeType() == BUY then
    if buyWithBackpack:isChecked() then
      if item.ptr:isStackable() then
          return item.price*amount + 20
      else
        return item.price*amount + math.ceil(amount/20)*20
      end
    end
  end
  return item.price*amount
end

function getSellQuantity(item)
  if not item or not playerItems[item:getId()] then return 0 end
  local removeAmount = 0
  if ignoreEquipped:isChecked() then
    local localPlayer = g_game.getLocalPlayer()
    for i=1,LAST_INVENTORY do
      local inventoryItem = localPlayer:getInventoryItem(i)
      if inventoryItem and inventoryItem:getId() == item:getId() then
        removeAmount = removeAmount + inventoryItem:getCount()
      end
    end
  end
  return playerItems[item:getId()] - removeAmount
end

function canTradeItem(item)
  if getCurrentTradeType() == BUY then
    return (ignoreCapacity:isChecked() or (not ignoreCapacity:isChecked() and playerFreeCapacity >= item.weight)) and playerMoney >= getItemPrice(item, true)
  else
    return getSellQuantity(item.ptr) > 0
  end
end

function refreshItem(item)
  idLabel:setText(item.ptr:getId())
  itemLabel:setItem(item.ptr)
  nameLabel:setText(item.name)
  weightLabel:setText(string.format('%.2f', item.weight) .. ' ' .. WEIGHT_UNIT)
  priceLabel:setText(formatCurrency(getItemPrice(item)))

  if getCurrentTradeType() == BUY then
    local capacityMaxCount = math.floor(playerFreeCapacity / item.weight)
    if ignoreCapacity:isChecked() then
      capacityMaxCount = 65535
    end
    local priceMaxCount = math.floor(playerMoney / getItemPrice(item, true))
    local finalCount = math.max(0, math.min(getMaxAmount(), math.min(priceMaxCount, capacityMaxCount)))
    quantityScroll:setMinimum(1)
    quantityScroll:setMaximum(finalCount)
  else
    quantityScroll:setMinimum(1)
    quantityScroll:setMaximum(math.max(0, math.min(getMaxAmount(), getSellQuantity(item.ptr))))
  end

  setupPanel:enable()
end

function refreshTradeItems()
  local layout = itemsPanel:getLayout()
  layout:disableUpdates()

  clearSelectedItem()

  searchText:clearText()
  setupPanel:disable()
  itemsPanel:destroyChildren()

  if radioItems then
    radioItems:destroy()
  end
  radioItems = UIRadioGroup.create()

  local currentTradeItems = tradeItems[getCurrentTradeType()]
  local isHalloween = false
  setCurrency('gold', false)
  for key,item in pairs(currentTradeItems) do
    if string.find(string.lower(item.name), "halloween") or string.find(string.lower(item.name), "pumpkinhead") then
      isHalloween = true
      setCurrency('halloween coin', false)
      break
    end
  end
  for key,item in pairs(currentTradeItems) do
    local itemBox = g_ui.createWidget('NPCItemBox', itemsPanel)

    if item.name == "vial" then
      local vial_subTypes = {
        [1] = {
          clientId = 2874,
          name = "water",
          priceSell = 10,
          priceBuy = 8,
        },
        [2] = {
          clientId = 2874,
          name = "wine",
          priceSell = 20,
          priceBuy = 25,
        },
        [3] = {
          clientId = 2874,
          name = "beer",
          priceSell = 30,
          priceBuy = 35,
        },
        [4] = {
          clientId = 2874,
          name = "mud",
          priceSell = 40,
          priceBuy = 45,
        },
        [5] = {
          clientId = 2874,
          name = "blood",
          priceSell = 50,
          priceBuy = 15,
        },
        [6] = {
          clientId = 2874,
          name = "slime",
          priceSell = 60,
          priceBuy = 12,
        },
        [7] = {
          clientId = 2874,
          name = "oil",
          priceSell = 70,
          priceBuy = 20,
        },
        [8] = {
          clientId = 2874,
          name = "urine",
          priceSell = 80,
          priceBuy = 10,
        },
        [9] = {
          clientId = 2874,
          name = "milk",
          priceSell = 90,
          priceBuy = 4,
        },
        [10] = {
          clientId = 2874,
          name = "mana fluid",
          priceSell = 0,
          priceBuy = 100,
        },
        [11] = {
          clientId = 2874,
          name = "life fluid",
          priceSell = 0,
          priceBuy = 60,
        },
        [12] = {
          clientId = 2874,
          name = "lemonade",
          priceSell = 120,
          priceBuy = 125,
        }
      }

      local id
      for _id, vial in pairs(vial_subTypes) do
        if getCurrentTradeType() == BUY and item.price == vial.priceBuy or getCurrentTradeType() == SELL and item.price == vial.priceSell then
          id = _id
          break
        end
      end


      if vial_subTypes[id] then
        item.name = "vial of " .. vial_subTypes[id].name
      end
    end

    itemBox.item = item
    itemBox.selected = false

    local text = ''
    local name = item.name
    itemBox.name:setText(name)
    text = text .. name
    if showWeight then
        local weight = string.format('%.2f', item.weight) .. ' ' .. WEIGHT_UNIT
        itemBox.weight:setVisible(false)
        itemBox.weight:setText(weight)
    end
    itemBox.gold:setItemSubType(1)
    local price = formatCurrency(item.price)
    itemBox.price:setText(price)

    local itemWidget = itemBox:getChildById('item')
    itemWidget:setItem(item.ptr)

    itemBox.onMouseRelease = itemPopup2
    itemWidget.onMouseRelease = itemPopup

    radioItems:addWidget(itemBox)
  end

  layout:enableUpdates()
  layout:update()
end

function refreshPlayerGoods()
  maxSelectableAmount = 0
  if not initialized then return end
  
  local items = itemsPanel:getChildCount()
  isHalloween = false
  setCurrency('gold', false)
  for i=1,items do
    local itemWidget = itemsPanel:getChildByIndex(i)
    local item = itemWidget.item
    if string.find(item.name:lower(), "halloween") or string.find(item.name:lower(), "pumpkinhead") then
      isHalloween = true
      setCurrency('halloween coin', false)
    end
  end
  
  checkSellAllTooltip()
  
  moneyLabel:setText(formatCurrency(playerMoney))
  capacityLabel:setText(string.format('%.2f', playerFreeCapacity) .. ' ' .. WEIGHT_UNIT)
  
  local currentTradeType = getCurrentTradeType()
  local searchFilter = searchText:getText():lower()
  local foundSelectedItem = false

  for i=1,items do
    local itemWidget = itemsPanel:getChildByIndex(i)
    local item = itemWidget.item
    local canTrade = canTradeItem(item)
    itemWidget:setOn(canTrade)
    itemWidget:setEnabled(canTrade)
    if canTrade and currentTradeType == SELL then
      maxSelectableAmount = maxSelectableAmount + 1
    end

    local searchCondition = (searchFilter == '') or (searchFilter ~= '' and string.find(item.name:lower(), searchFilter) ~= nil)
    local showAllItemsCondition = (showAllItems:isChecked()) or canTrade
    itemWidget:setVisible(searchCondition and showAllItemsCondition)

    if selectedItem == item and itemWidget:isEnabled() and itemWidget:isVisible() then
      foundSelectedItem = true
    end
  end

  if not foundSelectedItem then
    clearSelectedItem()
  end

  if selectedItem then
    refreshItem(selectedItem)
  end
end

function onOpenNpcTrade(items)
  tradeItems[BUY] = {}
  tradeItems[SELL] = {}

  isHalloween = false
  setCurrency('gold', false)
  for key,item in pairs(items) do
    if item[4] > 0 then
      local newItem = {}
      newItem.ptr = item[1]
      newItem.name = item[2]
      newItem.weight = item[3] / 100
      newItem.price = item[4]
      table.insert(tradeItems[BUY], newItem)
    end
    
    if string.find(string.lower(item[2]), "halloween") or string.find(string.lower(item[2]), "pumpkinhead") then
      setCurrency('halloween coin', false)
      isHalloween = true
    end
    
    if item[5] > 0 then
      local newItem = {}
      newItem.ptr = item[1]
      newItem.name = item[2]
      newItem.weight = item[3] / 100
      newItem.price = item[5]
      table.insert(tradeItems[SELL], newItem)
    end
  end

  refreshTradeItems()
  addEvent(show) -- player goods has not been parsed yet
end

function closeNpcTrade()
  g_game.closeNpcTrade()
  npcWindow:unlock()
  addEvent(hide)
end

function onCloseNpcTrade()
  addEvent(hide)
end

function onPlayerGoods(money, items)
  playerMoney = money
  playerItems = {}
  for key,item in pairs(items) do
    local id = item[1]:getId()
    if not playerItems[id] then
      playerItems[id] = item[2]
    else
      playerItems[id] = playerItems[id] + item[2]
    end
  end

  refreshPlayerGoods()
end

function onFreeCapacityChange(localPlayer, freeCapacity, oldFreeCapacity)
  playerFreeCapacity = freeCapacity * 100

  if npcWindow:isVisible() then
    refreshPlayerGoods()
  end
end

function onInventoryChange(inventory, item, oldItem)
  refreshPlayerGoods()
end

function getTradeItemData(id, type)
  if table.empty(tradeItems[type]) then
    return false
  end

  if type then
    for key,item in pairs(tradeItems[type]) do
      if item.ptr and item.ptr:getId() == id then
        return item
      end
    end
  else
    for _,items in pairs(tradeItems) do
      for key,item in pairs(items) do
        if item.ptr and item.ptr:getId() == id then
          return item
        end
      end
    end
  end
  return false
end

function checkSellAllTooltip()
  -- sellAllWithDelayButton:setEnabled(true)
  -- sellAllWithDelayButton:removeTooltip()

  local total = 0
  local info = ''
  local first = true

  local isHalloween = false
  for key, amount in pairs(playerItems) do
    local data = getTradeItemData(key, SELL)
    if data then
      if string.find(string.lower(data.name), "halloween") or string.find(string.lower(data.name), "pumpkinhead") then
        isHalloween = true
        break
      end
    end
  end

  for key, amount in pairs(playerItems) do
    local data = getTradeItemData(key, SELL)
    if data then
      amount = getSellQuantity(data.ptr)
      if amount > 0 then
        if data and amount > 0 then
          info = info..(not first and "\n" or "")..
                 amount.." "..
                 data.name.." ("..
              data.price * amount .. (isHalloween and " halloween coin)" or " gold)")
          total = total+(data.price*amount)
          if first then first = false end
        end
      end
    end
  end
  if info ~= '' then
    info = info .. "\nTotal: " .. total .. (isHalloween and " halloween coin" or " gold")
    -- sellAllWithDelayButton:setTooltip(info)
  else
    -- sellAllWithDelayButton:setEnabled(false)
  end
end

function formatCurrency(amount)
  if CURRENCY_DECIMAL then
    return string.format("%.02f", amount/100.0) .. ' ' .. CURRENCY
  else
    return amount .. ' ' .. CURRENCY
  end
end

function getMaxAmount()
  if getCurrentTradeType() == SELL and g_game.getFeature(GameDoubleShopSellAmount) then
    return 10000
  end
  return 2000
end


function selectAll()
  
  local items = itemsPanel:getChildCount()
  local v = sellAllButton:getText() == "Select all"
  for i=1,items do
    local itemWidget = itemsPanel:getChildByIndex(i)
    if canTradeItem(itemWidget.item) then
      if v then
        select_to_sell_item(itemWidget)
      else
        unselect_to_sell_item(itemWidget)
      end
    end
  end
end

function sellAll(delayed, exceptions)
  -- backward support
  exceptions = exceptions or {}
  local queue = {}
  -- for _,entry in ipairs(tradeItems[SELL]) do
  for i=1,itemsPanel:getChildCount() do
    local widget = itemsPanel:getChildByIndex(i)
    local entry = widget.item
    local id = entry.ptr:getId()
    if not table.find(exceptions, id) and widget.selected then
      local sellQuantity = getSellQuantity(entry.ptr)
      while sellQuantity > 0 do
        local maxAmount = math.min(sellQuantity, getMaxAmount())
        table.insert(queue, {entry.ptr, maxAmount, ignoreEquipped:isChecked()})
        sellQuantity = sellQuantity - maxAmount
      end
      unselect_to_sell_item(widget)
    end
  end
  for _, entry in ipairs(queue) do
    g_game.sellItem(entry[1], entry[2], entry[3])
  end
end
