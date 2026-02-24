local botWindow, player, botButton, antiLogoutButton, attackTrainerButton, manaTrainButton, eatFootButton, antiLogoutId, attackTrainerId, manaTrainId, eatFoodId = nil
local foodItems = {}
LAST_INVENTORY = 10

function init()
	botWindow = g_ui.displayUI("bot")
	player = g_game.getLocalPlayer()

	botWindow:hide()

	botButton = modules.client_topmenu.addLeftGameButton("botButton", tr("Bot"), "/images/topbuttons/bot", toggle)
	antiLogoutButton = botWindow.AntiLogout
	attackTrainerButton = botWindow.AttackTrainer
	manaTrainButton = botWindow.ManaTrain
	eatFootButton = botWindow.EatFood
	foodPanel = botWindow.FoodPanel
	foodItems = {}
	local childId = 1

	for _, child in pairs(foodPanel:getChildren()) do
		child:setId("FoodItem" .. childId)

		childId = childId + 1

		table.insert(foodItems, child)

		child.onItemChange = onUpdateFoodItem
	end

	botWindow.ManaSpellText.onTextChange = saveBotText
	botWindow.ManaTrainPercent.onTextChange = saveBotText

	connect(g_game, {
		onGameStart = logIn
	})

	if g_game.isOnline() then
		logIn()
	end
end

function terminate()
	botWindow:destroy()
	botButton:destroy()
	removeEvent(antiLogoutId)
	removeEvent(attackTrainerId)
	removeEvent(manaTrainId)
	removeEvent(eatFoodId)
	disconnect(g_game, {
		onGameStart = logIn
	})
end

function disable()
	botButton:hide()
end

function hide()
	botWindow:hide()
end

function show()
	botWindow:show()
	botWindow:raise()
	botWindow:focus()
end

function toggle()
	if botWindow:isVisible() then
		hide()
	else
		show()
	end
end

function saveBotText()
	g_settings.set(player:getName() .. " " .. botWindow:getFocusedChild():getId(), botWindow:getFocusedChild():getText())
end

function logIn()
	player = g_game.getLocalPlayer()

	for _, foodItemWidget in pairs(foodItems) do
		local storedText = g_settings.get(player:getName() .. " " .. foodItemWidget:getId())

		if storedText then
			foodItemWidget:setItemId(tonumber(storedText))
		end
	end

	local checkButtons = {
		antiLogoutButton,
		attackTrainerButton,
		manaTrainButton,
		eatFootButton
	}

	for _, checkButton in ipairs(checkButtons) do
		checkButton:setChecked(g_settings.getBoolean(player:getName() .. " " .. checkButton:getId()))
	end

	local textBoxes = {
		botWindow.ManaSpellText,
		botWindow.ManaTrainPercent
	}

	for _, textBox in ipairs(textBoxes) do
		local storedText = g_settings.get(player:getName() .. " " .. textBox:getId())

		if string.len(storedText) >= 1 then
			textBox:setText(storedText)
		end
	end
end

function toggleLoop(key)
	local bts = {
		AntiLogout = {
			antiLogoutLoop,
			antiLogoutId
		},
		AttackTrainer = {
			attackTrainerLoop,
			attackTrainerId
		},
		ManaTrain = {
			manaTrainLoop,
			manaTrainId
		},
		EatFood = {
			eatFoodLoop,
			eatFoodId
		}
	}
	local btn = botWindow:getChildById(key)
	local bt = bts[btn:getId()]

	if btn:isChecked() then
		g_settings.set(player:getName() .. " " .. btn:getId(), true)

		if bt then
			bt[1]()
		end
	else
		g_settings.set(player:getName() .. " " .. btn:getId(), false)

		if bt then
			removeEvent(bt[2])
		end
	end
end

function antiLogoutLoop()
	if not player then
		antiLogoutId = scheduleEvent(antiLogoutLoop, 1000)

		return
	end

	local dir = player:getDirection()

	g_game.turn((dir + 1) % 4)
	g_game.turn(dir)

	antiLogoutId = scheduleEvent(antiLogoutLoop, 840000)
end

local function getDistanceBetween(p1, p2)
	return math.max(math.abs(p1.x - p2.x), math.abs(p1.y - p2.y))
end

function Player:canAttack()
	return not self:hasState(16384) and not g_game.isAttacking()
end

function attackTrainerLoop()
	if not player then
		attackTrainerId = scheduleEvent(attackTrainerLoop, 1000)

		return
	end

	if player:canAttack() then
		local pPos = player:getPosition()

		if pPos then
			local trainers = {}

			for _, spec in pairs(g_map.getSpectators(pPos, false)) do
				if table.contains({
					"Training Dummy",
					"Target Board"
				}, spec:getName()) then
					trainers[#trainers + 1] = {
						monster = spec,
						distance = getDistanceBetween(pPos, spec:getPosition())
					}
				end
			end

			table.sort(trainers, function (a, b)
				return a.distance < b.distance
			end)

			local closestTrainer = trainers[1] and trainers[1].monster or false

			if closestTrainer then
				g_game.attack(closestTrainer)
			end
		end
	end

	attackTrainerId = scheduleEvent(attackTrainerLoop, 1000)
end

function manaTrainLoop()
	if not player then
		manaTrainId = scheduleEvent(manaTrainLoop, 1000)

		return
	end

	local manaTrainPercentage = tonumber(botWindow.ManaTrainPercent:getText())
	local manaSpell = botWindow.ManaSpellText:getText()

	if player:getMana() >= player:getMaxMana() * manaTrainPercentage / 100 then
		g_game.talk(manaSpell)
	end

	manaTrainId = scheduleEvent(manaTrainLoop, 1000)
end

function onUpdateFoodItem(widget)
	local item = widget and widget:getItem()

	if item then
		item:setCount(1)
	end

	g_settings.set(player:getName() .. " " .. widget:getId(), item and item:getId() or 0)
end

function eatFoodLoop()
	if not player then
		eatFoodId = scheduleEvent(eatFoodLoop, 1000)

		return
	end

	if player:getRegenerationTime() > 400 or not foodItems[1] then
		eatFoodId = scheduleEvent(eatFoodLoop, 2000)

		return
	end

	local foodFound = false

	for _, container in pairs(g_game.getContainers()) do
		for __, item in ipairs(container:getItems()) do
			for i, foodItemWidget in ipairs(foodItems) do
				local foodItem = foodItemWidget:getItem()

				if foodItem and item:getId() == foodItem:getId() then
					g_game.use(item)

					foodFound = true

					break
				end
			end
		end
	end

	if not foodFound then
		for i = 1, LAST_INVENTORY do
			local inventoryItem = player:getInventoryItem(i)

			if inventoryItem then
				for _, foodItemWidget in ipairs(foodItems) do
					local foodItem = foodItemWidget:getItem()

					if foodItem and inventoryItem:getId() == foodItem:getId() then
						g_game.use(inventoryItem)

						break
					end
				end
			end
		end
	end

	eatFoodId = scheduleEvent(eatFoodLoop, 2000)
end
