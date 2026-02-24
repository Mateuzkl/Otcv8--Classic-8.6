LOOT_SIMULATOR_OPCODE = 222
HISTORY_MAX_LENGTH = 123
PRINT_WORTHLESS_LOOT_TO_CONSOLE = false
lootSimulatorWindow = nil
lootWindow = nil
generalWindow = nil
isRunning = false
simulatorHistory = {}

function init()
	connect(g_game, {
		onGameEnd = logout
	})
	createLootSimulatorWindow()
	createLootWindow()
	ProtocolGame.registerExtendedJSONOpcode(LOOT_SIMULATOR_OPCODE, onExtendedJSONOpcode)
end

function terminate()
	disconnect(g_game, {
		onGameStart = login,
		onGameEnd = logout
	})

	if lootSimulatorWindow then
		disconnect(lootSimulatorWindow.availableMonsters.textList, {
			onChildFocusChange = changeMonster
		})
		lootSimulatorWindow:destroy()

		lootSimulatorWindow = nil
		simulatorHistory = {}
	end

	if generalWindow then
		generalWindow:destroy()

		generalWindow = nil
	end

	if lootWindow then
		lootWindow:destroy()

		lootWindow = nil
	end

	ProtocolGame.unregisterExtendedJSONOpcode(LOOT_SIMULATOR_OPCODE, onExtendedJSONOpcode)
end

function onExtendedJSONOpcode(protocol, code, json_data)
	local action = json_data.action

	if action == "renderAvailableMonsters" then
		renderAvailableMonsters(json_data.data)
	elseif action == "getAvailableMonsterLoot" then
		renderAvailableMonsterLoot(json_data.data)
	elseif action == "renderSimulationLoot" then
		renderSimulationLootItems(json_data.data)
	end
end

function login()
	createLootSimulatorWindow()
	createLootWindow()
end

function logout()
	hide()
	lootWindow:hide()
end

function sendAction(action, data)
	local protocolGame = g_game.getProtocolGame()
	data = data or {}

	if protocolGame then
		protocolGame:sendExtendedJSONOpcode(LOOT_SIMULATOR_OPCODE, {
			action = action,
			data = data
		})
	end
end

function createLootSimulatorWindow()
	if lootSimulatorWindow then
		return
	end

	lootSimulatorWindow = g_ui.displayUI("lootsimulator")

	lootSimulatorWindow:hide()

	lootTable = lootSimulatorWindow:recursiveGetChildById("simulationTable")

	connect(lootSimulatorWindow.availableMonsters.textList, {
		onChildFocusChange = changeMonster
	})
end

function createLootWindow()
	if lootWindow then
		return
	end

	lootWindow = g_ui.displayUI("lootwindow")

	lootWindow:hide()
end

function toggle()
	if lootSimulatorWindow:isVisible() then
		hide()
	else
		show()
	end
end

function hide()
	lootSimulatorWindow:hide()
end

function show()
	lootSimulatorWindow:show()
	lootSimulatorWindow:raise()
	lootSimulatorWindow:focus()

	if lootSimulatorWindow.availableMonsters.textList:getChildCount() == 0 then
		sendAction("getAvailableMonsters")
	end
end

function toggleLootWindow()
	if lootWindow:isVisible() then
		lootWindow:hide()
		show()
	else
		hide()

		local focusedCreature = lootSimulatorWindow.availableMonsters.textList:getFocusedChild()
		local creatureName = focusedCreature.creature:getTooltip()

		if lootWindow:getText():split("-")[1]:trim():lower() ~= creatureName:trim():lower() then
			clearWidgetChildren(lootWindow.items.textList)
			sendAction("getAvailableMonsterLoot", creatureName)
		end

		lootWindow:setText("" .. creatureName .. " - loot statistics")
		lootWindow:show()
		lootSimulatorWindow:raise()
		lootSimulatorWindow:focus()
	end
end

function renderAvailableMonsters(monsters)
	local mPanel = lootSimulatorWindow.availableMonsters.textList

	for i = 1, #monsters do
		local mInfo = monsters[i]
		local mWidget = g_ui.createWidget("RowCreature", mPanel)

		mWidget.name:setText(formatText(mInfo.name, mInfo.onMap))
		mWidget.creature:setTooltip(mInfo.name)
		mWidget.creature:setOutfit(mInfo.outfit)
	end

	mPanel:focusChild(mPanel:getFirstChild())
end

function clearWidgetChildren(widget)
	while widget:getChildCount() > 0 do
		local child = widget:getLastChild()

		widget:destroyChildren(child)
	end
end

function renderAvailableMonsterLoot(items)
	local worthlessLoot = {}

	table.sort(items, function (a, b)
		local aPrice = lootItems[a.name] or 0
		local bPrice = lootItems[b.name] or 0

		return aPrice > bPrice
	end)

	local iPanel = lootWindow.items.textList

	for i = 1, #items do
		local iInfo = items[i]
		local iWidget = g_ui.createWidget("LootRowItem", iPanel)
		local itemPrice = iInfo.worth or 0

		if itemPrice == 0 then
			table.insert(worthlessLoot, iInfo.name)
		end

		iWidget.item:setItemId(iInfo.cId)
		iWidget.item:setTooltip("" .. formatNumber(itemPrice) .. " gp")
		iWidget.labels.name.val:setText(iInfo.name)
		iWidget.labels.chance.val:setText(iInfo.chance .. "%")
		iWidget.labels.count.val:setText(iInfo.count)
	end

	printWorthlessLoot(worthlessLoot)
end

function renderSimulationLootItems(simulation)
	local worthlessLoot = {}

	table.sort(simulation.items, function (a, b)
		local aPrice = lootItems[a.name] or 0
		local bPrice = lootItems[b.name] or 0

		return aPrice > bPrice
	end)

	local lootPanel = lootSimulatorWindow:recursiveGetChildById("loot").textList

	for i = 1, #simulation.items do
		local data = simulation.items[i]
		local iWidget = g_ui.createWidget("SimulationRowItem", lootPanel)
		local itemPrice = data.worth or 0

		if itemPrice == 0 then
			table.insert(worthlessLoot, data.name)
		end

		iWidget.item:setItemId(data.cId)
		iWidget.item:setTooltip("" .. formatNumber(itemPrice) .. " gp")
		iWidget.name:setText(data.name)
		iWidget.avg:setText(data.avg)
		iWidget.kills:setText(data.get)
		iWidget.chance:setText(data.chance .. "%")
		iWidget.count:setText(data.count .. "x")

		local countText = {}
		local rareChances = {}
		local rareTotal = {}
		local droppedRare = false

		for index, value in ipairs(data.rareCount) do
			if value > 0 then
				droppedRare = true

				table.insert(countText, " " .. value)
				table.insert(countText, ItemRarityColour[index])
				table.insert(rareChances, " " .. data.rareChances[index] .. "%")
				table.insert(rareChances, ItemRarityColour[index])
			else
				table.insert(countText, " " .. 0)
				table.insert(countText, ItemRarityColour[index])
				table.insert(rareChances, " " .. 0 .. "%")
				table.insert(rareChances, ItemRarityColour[index])
			end
		end

		if droppedRare then
			iWidget.rares:setColoredText(countText)
			iWidget.raresChance:setColoredText(rareChances)
		else
			iWidget.rares:setText("None")
			iWidget.raresChance:setText("0%")
		end
	end

	local labels = lootSimulatorWindow.simulationPanel.simulationLoot.statistics
	local total, avg = getSimulationLootStatistics(simulation.items, simulation.kills)

	labels.totalValue:setText("Total Value: " .. formatNumber(total) .. " gp")
	labels.avgValue:setText("Avg: " .. formatNumber(avg) .. " gp")
	saveToHistory(simulation.outfit, simulation.name, total, avg, simulation.kills, simulation.rate, simulation.items)
	printWorthlessLoot(worthlessLoot)

	isRunning = false
end

function getSimulationLootStatistics(items, kills)
	local total = 0

	for i = 1, #items do
		local item = items[i]
		local itemPrice = (item.worth or 0) * tonumber(item.count)
		total = total + itemPrice
	end

	return math.floor(total), math.floor(total / kills)
end

function runSimulation()
	local monster = lootSimulatorWindow.availableMonsters.textList:getFocusedChild().creature:getTooltip()
	local killsAmount = tonumber(lootSimulatorWindow.amountPanel.amountEdit:getText())
	local lootRate = tonumber(lootSimulatorWindow.ratePanel.rateEdit:getText())
	local rareDropTableActive = lootSimulatorWindow.rareDropTablePanel.rareDropCheckBox:isChecked()

	if lootRate == nil then
		lootRate = 0
	end

	local function yesFunc()
		if generalWindow then
			generalWindow:destroy()

			generalWindow = nil
		end
	end

	if not killsAmount then
		if not generalWindow then
			generalWindow = displayGeneralBox(tr("Missing Arguments!"), tr("Please define kills amount"), {
				{
					text = tr("Ok"),
					callback = yesFunc
				},
				anchor = AnchorHorizontalCenter
			}, yesFunc)
		end

		return
	end

	if isRunning then
		if not generalWindow then
			generalWindow = displayGeneralBox(tr("Simulation in Progress!"), tr("Similation is still running. Please wait."), {
				{
					text = tr("Ok"),
					callback = yesFunc
				},
				anchor = AnchorHorizontalCenter
			}, yesFunc)
		end

		return
	else
		isRunning = true

		clearWidgetChildren(lootSimulatorWindow:recursiveGetChildById("loot").textList)
		sendAction("runSimulation", {
			monster = monster,
			kills = killsAmount,
			rateLoot = lootRate,
			includeRareDropTable = rareDropTableActive
		})
	end
end

function toggleHistory()
	local simulationPanel = lootSimulatorWindow.simulationPanel
	local historyPanel = lootSimulatorWindow.historyPanel

	if historyPanel:isVisible() then
		clearWidgetChildren(historyPanel)
		simulationPanel:setVisible(true)
		historyPanel:setVisible(false)
	else
		historyPanel:setVisible(true)
		simulationPanel:setVisible(false)
		renderHistoryItems()
	end
end

function saveToHistory(creatureOutfit, creatureName, totalValue, avgValue, kills, rate, items)
	local simulation = {
		cOutfit = creatureOutfit,
		cName = creatureName,
		total = totalValue,
		avg = avgValue,
		kills = kills,
		rate = rate,
		items = items
	}

	if HISTORY_MAX_LENGTH <= #simulatorHistory then
		table.remove(simulatorHistory, #simulatorHistory)
		table.insert(simulatorHistory, 1, simulation)
	else
		table.insert(simulatorHistory, 1, simulation)
	end
end

function renderHistoryItems()
	local historyPanel = lootSimulatorWindow.historyPanel

	for i = 1, #simulatorHistory do
		local data = simulatorHistory[i]
		local cWidget = g_ui.createWidget("HistoryCreature", historyPanel)

		cWidget:setText(formatText(data.cName))
		cWidget.creature:setOutfit(data.cOutfit)
		cWidget.creature:setTooltip(data.cName)
		cWidget.labels.kills:setText("Kills: " .. data.kills .. "")
		cWidget.labels.rate:setText("Loot Rate: " .. data.rate .. "x")
		cWidget.labels.total:setText("Total: " .. formatNumber(data.total) .. " gp")
		cWidget.labels.avg:setText("Avg: " .. formatNumber(data.avg) .. " gp")

		local tooltipText = ""

		for j = 1, #data.items do
			local itData = data.items[j]
			local itText = itData.name .. ": " .. itData.count .. "x | " .. itData.chance .. "%" .. (j ~= #data.items and "\n" or "")
			tooltipText = tooltipText .. itText
		end

		cWidget.lootInfo:setTooltip(tooltipText)
	end
end

function monsterSearch()
	local searchParam = lootSimulatorWindow.choosePanel.monsterSearch:getText():trim():lower()
	local monstersList = lootSimulatorWindow.availableMonsters.textList

	for _, child in ipairs(monstersList:getChildren()) do
		if child.creature:getTooltip():lower():find(searchParam) then
			child:setVisible(true)
		else
			child:setVisible(false)
		end
	end
end

function getRandomSettings()
	local labels = lootSimulatorWindow.simulationPanel.simulationDetails.labels
	local searchEdit = lootSimulatorWindow.choosePanel.monsterSearch
	local killsAmount = lootSimulatorWindow.amountPanel.amountEdit
	local lootRate = lootSimulatorWindow.ratePanel.rateEdit
	local monstersList = lootSimulatorWindow.availableMonsters.textList
	local monstersCount = monstersList:getChildCount()
	local monsterIndex = math.random(monstersCount)
	local randomMonster = monstersList:getChildByIndex(monsterIndex)
	local searchParam = randomMonster.creature:getTooltip():trim():lower()
	local kills = math.random(1000)
	local rate = math.random(15)

	lootRate:setText(rate)
	killsAmount:setText(kills)
	searchEdit:setText(searchParam)
	monstersList:focusChild(randomMonster)
	searchEdit:setCursorPos(-1)
	labels.kills:setText("Monster kills: " .. kills .. "")
	labels.rate:setText("Loot rate: " .. rate .. "")
	monsterSearch()
end

function changeMonster(list, focusedChild, unfocusedChild, reason)
	local widget = lootSimulatorWindow.simulationPanel.chosenPanel.chosenCreature
	local labels = lootSimulatorWindow.simulationPanel.simulationDetails.labels

	widget:setOutfit(focusedChild.creature:getOutfit())
	labels.name:setText("Monster name: " .. focusedChild.creature:getTooltip() .. "")
end

function amountChange()
	local searchParam = lootSimulatorWindow.amountPanel.amountEdit:getText():trim():lower()
	local labels = lootSimulatorWindow.simulationPanel.simulationDetails.labels

	if #searchParam ~= 0 then
		labels.kills:setText("Monster kills: " .. searchParam .. "")
	else
		labels.kills:setText("Monster kills: -")
	end
end

function rateChange()
	local searchParam = lootSimulatorWindow.ratePanel.rateEdit:getText():trim():lower()
	local labels = lootSimulatorWindow.simulationPanel.simulationDetails.labels

	if #searchParam ~= 0 then
		labels.rate:setText("Loot rate: " .. searchParam .. "")
	else
		labels.rate:setText("Loot rate: -")
	end
end

function formatText(text, onMap)
	local t = ""

	if #text >= 20 then
		t = string.sub(text, 1, 17) .. "..."
	else
		t = text
	end

	if onMap then
		return t .. " (1)"
	else
		return t .. " (0)"
	end
end

function formatNumber(number)
	local formatted = tostring(number)
	formatted = string.reverse(formatted)
	formatted = string.gsub(formatted, "(%d%d%d)", "%1 ")
	formatted = string.reverse(formatted)

	return formatted
end

function printWorthlessLoot(items)
	if PRINT_WORTHLESS_LOOT_TO_CONSOLE and #items > 0 then
		local sepLength = 30
		local sep = string.rep("-", sepLength, "")

		print()
		print(sep)

		for i = 1, #items do
			local itemName = items[i]

			print("" .. itemName .. " -> 0 gp")
		end

		print(sep)
	end
end
