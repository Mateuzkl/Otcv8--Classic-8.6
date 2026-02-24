skillsWindow = nil
expLabel = nil

function init()
	connect(LocalPlayer, {
		onExperienceChange = onExperienceChange,
		onLevelChange = onLevelChange,
		onHealthChange = onHealthChange,
		onManaChange = onManaChange,
		onSoulChange = onSoulChange,
		onFreeCapacityChange = onFreeCapacityChange,
		onTotalCapacityChange = onTotalCapacityChange,
		onOfflineTrainingChange = onOfflineTrainingChange,
		onRegenerationChange = onRegenerationChange,
		onSpeedChange = onSpeedChange,
		onBaseSpeedChange = onBaseSpeedChange,
		onMagicLevelChange = onMagicLevelChange,
		onBaseMagicLevelChange = onBaseMagicLevelChange,
		onSkillChange = onSkillChange,
		onBaseSkillChange = onBaseSkillChange
	})
	connect(g_game, {
		onGameStart = refresh,
		onGameEnd = offline
	})
	g_keyboard.bindKeyDown("Ctrl+S", toggle)

	skillsWindow = g_ui.loadUI("skills", modules.game_interface.getRightPanel())
	expLabel = skillsWindow:recursiveGetChildById("experience")
	local scrollbar = skillsWindow:getChildById("miniwindowScrollBar")

	scrollbar:mergeStyle({
		["$!on"] = {}
	})
	refresh()
	skillsWindow:setup()
end

function terminate()
	disconnect(LocalPlayer, {
		onExperienceChange = onExperienceChange,
		onLevelChange = onLevelChange,
		onHealthChange = onHealthChange,
		onManaChange = onManaChange,
		onSoulChange = onSoulChange,
		onFreeCapacityChange = onFreeCapacityChange,
		onTotalCapacityChange = onTotalCapacityChange,
		onOfflineTrainingChange = onOfflineTrainingChange,
		onRegenerationChange = onRegenerationChange,
		onSpeedChange = onSpeedChange,
		onBaseSpeedChange = onBaseSpeedChange,
		onMagicLevelChange = onMagicLevelChange,
		onBaseMagicLevelChange = onBaseMagicLevelChange,
		onSkillChange = onSkillChange,
		onBaseSkillChange = onBaseSkillChange
	})
	disconnect(g_game, {
		onGameStart = refresh,
		onGameEnd = offline
	})
	g_keyboard.unbindKeyDown("Ctrl+S")
	skillsWindow:destroy()
end

function expForLevel(level)
	return math.floor(50 * level * level * level / 3 - 100 * level * level + 850 * level / 3 - 200)
end

function expToAdvance(currentLevel, currentExp)
	return expForLevel(currentLevel + 1) - currentExp
end

function resetSkillColor(id)
	local skill = skillsWindow:recursiveGetChildById(id)
	local widget = skill:getChildById("value")

	widget:setColor("#bbbbbb")
end

function toggleSkill(id, state)
	local skill = skillsWindow:recursiveGetChildById(id)

	skill:setVisible(state)
end

function setSkillBase(id, value, baseValue)
	if baseValue <= 0 or value < 0 then
		return
	end

	local skill = skillsWindow:recursiveGetChildById(id)
	local widget = skill:getChildById("value")

	if baseValue < value then
		widget:setColor("#008b00")
		skill:setTooltip(baseValue .. " +" .. value - baseValue)
	elseif value < baseValue then
		widget:setColor("#b22222")
		skill:setTooltip(baseValue .. " " .. value - baseValue)
	else
		widget:setColor("#bbbbbb")
		skill:removeTooltip()
	end
end

function setSkillValue(id, value)
	local skill = skillsWindow:recursiveGetChildById(id)
	local widget = skill:getChildById("value")

	widget:setText(value)
end

function setSkillColor(id, value)
	local skill = skillsWindow:recursiveGetChildById(id)
	local widget = skill:getChildById("value")

	widget:setColor(value)
end

function setSkillTooltip(id, value)
	local skill = skillsWindow:recursiveGetChildById(id)
	local widget = skill:getChildById("value")

	widget:setTooltip(value)
end

function setSkillPercent(id, percent, tooltip, color)
	local skill = skillsWindow:recursiveGetChildById(id)
	local widget = skill:getChildById("percent")

	if widget then
		widget:setPercent(math.floor(percent))

		if tooltip then
			widget:setTooltip(tooltip)
		end

		if color then
			widget:setBackgroundColor(color)
		end
	end
end

function checkAlert(id, value, maxValue, threshold, greaterThan)
	if greaterThan == nil then
		greaterThan = false
	end

	local alert = false

	if type(maxValue) == "boolean" then
		if maxValue then
			return
		end

		if greaterThan then
			if threshold < value then
				alert = true
			end
		elseif value < threshold then
			alert = true
		end
	elseif type(maxValue) == "number" then
		if maxValue < 0 then
			return
		end

		local percent = math.floor(value / maxValue * 100)

		if greaterThan then
			if threshold < percent then
				alert = true
			end
		elseif percent < threshold then
			alert = true
		end
	end

	if alert then
		setSkillColor(id, "#b22222")
	else
		resetSkillColor(id)
	end
end

function update()
	local offlineTraining = skillsWindow:recursiveGetChildById("offlineTraining")

	if not g_game.getFeature(GameOfflineTrainingTime) then
		offlineTraining:hide()
	else
		offlineTraining:show()
	end

	local regenerationTime = skillsWindow:recursiveGetChildById("regenerationTime")

	if not g_game.getFeature(GamePlayerRegenerationTime) then
		regenerationTime:hide()
	else
		regenerationTime:show()
	end
end

function refresh()
	local player = g_game.getLocalPlayer()

	if not player then
		return
	end

	if expSpeedEvent then
		expSpeedEvent:cancel()
	end

	expSpeedEvent = cycleEvent(checkExpSpeed, 30000)

	onExperienceChange(player, player:getExperience())
	onLevelChange(player, player:getLevel(), player:getLevelPercent())
	onHealthChange(player, player:getHealth(), player:getMaxHealth())
	onManaChange(player, player:getMana(), player:getMaxMana())
	onSoulChange(player, player:getSoul())
	onFreeCapacityChange(player, player:getFreeCapacity())
	onMagicLevelChange(player, player:getMagicLevel(), player:getMagicLevelPercent())
	onOfflineTrainingChange(player, player:getOfflineTrainingTime())
	onRegenerationChange(player, player:getRegenerationTime())
	onSpeedChange(player, player:getSpeed())

	local hasAdditionalSkills = g_game.getFeature(GameAdditionalSkills)

	for i = Skill.Fist, Skill.ManaLeechAmount do
		onSkillChange(player, i, player:getSkillLevel(i), player:getSkillLevelPercent(i))
		onBaseSkillChange(player, i, player:getSkillBaseLevel(i))

		if Skill.Fishing < i then
			toggleSkill("skillId" .. i, hasAdditionalSkills)
		end
	end

	update()

	local contentsPanel = skillsWindow:getChildById("contentsPanel")

	skillsWindow:setContentMinimumHeight(38)

	if hasAdditionalSkills then
		skillsWindow:setContentMaximumHeight(480)
	else
		skillsWindow:setContentMaximumHeight(330)
	end
end

function offline()
	if expSpeedEvent then
		expSpeedEvent:cancel()

		expSpeedEvent = nil
	end
end

function toggle()
	if modules.game_sidebuttons.skillsButton:isOn() then
		skillsWindow:close()
		modules.game_sidebuttons.skillsButton:setOn(false)
	else
		skillsWindow:open()
		modules.game_sidebuttons.skillsButton:setOn(true)
	end
end

function checkExpSpeed()
	local player = g_game.getLocalPlayer()

	if not player then
		return
	end

	local currentExp = player:getExperience()
	local currentTime = g_clock.seconds()

	if player.lastExps ~= nil then
		player.expSpeed = (currentExp - player.lastExps[1][1]) / (currentTime - player.lastExps[1][2])

		onLevelChange(player, player:getLevel(), player:getLevelPercent())
	else
		player.lastExps = {}
	end

	table.insert(player.lastExps, {
		currentExp,
		currentTime
	})

	if #player.lastExps > 30 then
		table.remove(player.lastExps, 1)
	end
end

function onMiniWindowClose()
	modules.game_sidebuttons.skillsButton:setOn(false)
end

function onSkillButtonClick(button)
	local percentBar = button:getChildById("percent")

	if percentBar then
		percentBar:setVisible(not percentBar:isVisible())

		if percentBar:isVisible() then
			button:setHeight(21)
		else
			button:setHeight(15)
		end
	end
end

function updateExpTooltip(localPlayer, playerLevel, playerExp)
	if playerLevel < 1 or playerExp < 0 then
		return
	end

	local expString = tr("%s exp. for next level", expToAdvance(playerLevel, playerExp))

	if localPlayer.expSpeed ~= nil then
		local expPerHour = math.floor(localPlayer.expSpeed * 3600)

		if expPerHour > 0 then
			local nextLevelExp = expForLevel(playerLevel + 1)
			local hoursLeft = (nextLevelExp - playerExp) / expPerHour
			local minutesLeft = math.floor((hoursLeft - math.floor(hoursLeft)) * 60)
			hoursLeft = math.floor(hoursLeft)
			expString = expString .. tr(", currently %s exp. per hour", comma_value(expPerHour))
			expString = expString .. tr(", next level in %d hours and %d minutes", hoursLeft, minutesLeft)
		end
	end

	expLabel:setTooltip(expString)
end

function onExperienceChange(localPlayer, value)
	if value < 0 then
		return
	end

	setSkillValue("experience", comma_value(value))
	addEvent(function ()
		local localPlayer = g_game.getLocalPlayer()

		if not localPlayer then
			return
		end

		updateExpTooltip(localPlayer, localPlayer:getLevel(), localPlayer:getExperience())
	end)
end

function onLevelChange(localPlayer, value, percent)
	setSkillValue("level", comma_value(value))
	setSkillPercent("level", percent, tr("You have %s percent to go", 100 - percent))
end

function onHealthChange(localPlayer, health, maxHealth)
	setSkillValue("health", health)
	checkAlert("health", health, maxHealth, 30)
end

function onManaChange(localPlayer, mana, maxMana)
	setSkillValue("mana", mana)
	checkAlert("mana", mana, maxMana, 30)
end

function onSoulChange(localPlayer, soul)
	setSkillValue("soul", soul)
end

function onFreeCapacityChange(localPlayer, freeCapacity)
	if not freeCapacity then
		return
	end

	local adjustedCapacity = freeCapacity

	if adjustedCapacity > 100000 then
		adjustedCapacity = 0
	end

	adjustedCapacity = math.floor(adjustedCapacity)

	if adjustedCapacity > 99999 then
		adjustedCapacity = math.min(9999, math.floor(adjustedCapacity / 1000)) .. "k"
	end

	setSkillValue("capacity", adjustedCapacity)
	checkAlert("capacity", freeCapacity, localPlayer:getTotalCapacity(), 20)
end

function onTotalCapacityChange(localPlayer, totalCapacity)
	checkAlert("capacity", localPlayer:getFreeCapacity(), totalCapacity, 20)
end

function onOfflineTrainingChange(localPlayer, offlineTrainingTime)
	if not g_game.getFeature(GameOfflineTrainingTime) then
		return
	end

	local hours = math.floor(offlineTrainingTime / 60)
	local minutes = offlineTrainingTime % 60

	if minutes < 10 then
		minutes = "0" .. minutes
	end

	local percent = 100 * offlineTrainingTime / 720

	setSkillValue("offlineTraining", hours .. ":" .. minutes)
	setSkillPercent("offlineTraining", percent, tr("You have %s percent", percent))
end

function onRegenerationChange(localPlayer, regenerationTime)
	if not g_game.getFeature(GamePlayerRegenerationTime) or regenerationTime < 0 then
		return
	end

	local minutes = math.floor(regenerationTime / 60)
	local seconds = regenerationTime % 60

	if seconds < 10 then
		seconds = "0" .. seconds
	end

	setSkillValue("regenerationTime", minutes .. ":" .. seconds)
	checkAlert("regenerationTime", regenerationTime, false, 300)
end

function onSpeedChange(localPlayer, speed)
	setSkillValue("speed", speed)
	onBaseSpeedChange(localPlayer, localPlayer:getBaseSpeed())
end

function onBaseSpeedChange(localPlayer, baseSpeed)
	setSkillBase("speed", localPlayer:getSpeed(), baseSpeed)
end

function onMagicLevelChange(localPlayer, magiclevel, percent)
	setSkillValue("magiclevel", magiclevel)
	setSkillPercent("magiclevel", percent, tr("You have %s percent to go", 100 - percent))
	onBaseMagicLevelChange(localPlayer, localPlayer:getBaseMagicLevel())
end

function onBaseMagicLevelChange(localPlayer, baseMagicLevel)
	setSkillBase("magiclevel", localPlayer:getMagicLevel(), baseMagicLevel)
end

function onSkillChange(localPlayer, id, level, percent)
	setSkillValue("skillId" .. id, level)
	setSkillPercent("skillId" .. id, percent, tr("You have %s percent to go", 100 - percent))
	onBaseSkillChange(localPlayer, id, localPlayer:getSkillBaseLevel(id))
end

function onBaseSkillChange(localPlayer, id, baseLevel)
	setSkillBase("skillId" .. id, localPlayer:getSkillLevel(id), baseLevel)
end
