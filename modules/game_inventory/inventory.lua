Icons = {
	[PlayerStates.Poison] = {
		path = "/images/game/states/poisoned",
		id = "condition_poisoned",
		tooltip = tr("You are poisoned")
	},
	[PlayerStates.Burn] = {
		path = "/images/game/states/burning",
		id = "condition_burning",
		tooltip = tr("You are burning")
	},
	[PlayerStates.Energy] = {
		path = "/images/game/states/electrified",
		id = "condition_electrified",
		tooltip = tr("You are electrified")
	},
	[PlayerStates.Drunk] = {
		path = "/images/game/states/drunk",
		id = "condition_drunk",
		tooltip = tr("You are drunk")
	},
	[PlayerStates.ManaShield] = {
		path = "/images/game/states/magic_shield",
		id = "condition_magic_shield",
		tooltip = tr("You are protected by a magic shield")
	},
	[PlayerStates.Paralyze] = {
		path = "/images/game/states/slowed",
		id = "condition_slowed",
		tooltip = tr("You are paralysed")
	},
	[PlayerStates.Haste] = {
		path = "/images/game/states/haste",
		id = "condition_haste",
		tooltip = tr("You are hasted")
	},
	[PlayerStates.Swords] = {
		path = "/images/game/states/logout_block",
		id = "condition_logout_block",
		tooltip = tr("You may not logout during a fight")
	},
	[PlayerStates.Drowning] = {
		path = "/images/game/states/drowning",
		id = "condition_drowning",
		tooltip = tr("You are drowning")
	},
	[PlayerStates.Freezing] = {
		path = "/images/game/states/freezing",
		id = "condition_freezing",
		tooltip = tr("You are freezing")
	},
	[PlayerStates.Dazzled] = {
		path = "/images/game/states/dazzled",
		id = "condition_dazzled",
		tooltip = tr("You are dazzled")
	},
	[PlayerStates.Cursed] = {
		path = "/images/game/states/cursed",
		id = "condition_cursed",
		tooltip = tr("You are cursed")
	},
	[PlayerStates.PartyBuff] = {
		path = "/images/game/states/strengthened",
		id = "condition_strengthened",
		tooltip = tr("You are strengthened")
	},
	[PlayerStates.PzBlock] = {
		path = "/images/game/states/protection_zone_block",
		id = "condition_protection_zone_block",
		tooltip = tr("You may not logout or enter a protection zone")
	},
	[PlayerStates.Pz] = {
		path = "/images/game/states/protection_zone",
		id = "condition_protection_zone",
		tooltip = tr("You are within a protection zone")
	},
	[PlayerStates.Bleeding] = {
		path = "/images/game/states/bleeding",
		id = "condition_bleeding",
		tooltip = tr("You are bleeding")
	},
	[PlayerStates.Hungry] = {
		path = "/images/game/states/hungry",
		id = "condition_hungry",
		tooltip = tr("You are hungry")
	}
}
SkullIcons = {
	[SkullGreen] = {
		path = "/images/game/states/skullgreen",
		id = "skullIcon",
		tooltip = tr("You are a member of a party")
	},
	[SkullWhite] = {
		path = "/images/game/states/skullwhite",
		id = "skullIcon",
		tooltip = tr("You have attacked an unmarked player")
	},
	[SkullRed] = {
		path = "/images/game/states/skullred",
		id = "skullIcon",
		tooltip = tr("You have killed too many unmarked players")
	}
}
InventorySlotStyles = {
	[InventorySlotHead] = "HeadSlot",
	[InventorySlotNeck] = "NeckSlot",
	[InventorySlotBack] = "BackSlot",
	[InventorySlotBody] = "BodySlot",
	[InventorySlotRight] = "RightSlot",
	[InventorySlotLeft] = "LeftSlot",
	[InventorySlotLeg] = "LegSlot",
	[InventorySlotFeet] = "FeetSlot",
	[InventorySlotFinger] = "FingerSlot",
	[InventorySlotAmmo] = "AmmoSlot"
}
inventoryWindow = nil
inventoryPanel = nil
inventoryButton = nil
purseButton = nil
combatControlsWindow = nil
fightOffensiveBox = nil
fightBalancedBox = nil
fightDefensiveBox = nil
chaseModeButton = nil
safeFightButton = nil
mountButton = nil
fightModeRadioGroup = nil
chaseModeRadioGroup = nil
chaseModeStandBox = nil
chaseModeChaseBox = nil
buttonPvp = nil
skillsButton = nil
battleButton = nil
vipButton = nil
questButton = nil
botButton = nil
soulLabel = nil
capLabel = nil
conditionPanel = nil

function init()
	connect(LocalPlayer, {
		onInventoryChange = onInventoryChange,
		onBlessingsChange = onBlessingsChange
	})
	connect(g_game, {
		onGameStart = refresh
	})

	inventoryWindow = g_ui.loadUI("inventory", modules.game_interface.getRightPanel())

	inventoryWindow:disableResize()

	inventoryPanel = inventoryWindow:getChildById("contentsPanel")

	if not inventoryWindow.forceOpen then
		inventoryButton = modules.client_topmenu.addRightGameToggleButton("inventoryButton", tr("Inventory") .. " (Ctrl+I)", "/images/topbuttons/inventory", toggle)

		inventoryButton:setOn(true)
	end

	purseButton = inventoryWindow:recursiveGetChildById("purseButton")

	function purseButton.onClick()
		local purse = g_game.getLocalPlayer():getInventoryItem(InventorySlotPurse)

		if purse then
			g_game.use(purse)
		end
	end

	skillsButton = inventoryWindow:recursiveGetChildById("skillsButton")
	battleButton = inventoryWindow:recursiveGetChildById("battleButton")
	vipButton = inventoryWindow:recursiveGetChildById("vipButton")
	questButton = inventoryWindow:recursiveGetChildById("questButton")
	botButton = inventoryWindow:recursiveGetChildById("botButton")
	fightOffensiveBox = inventoryWindow:recursiveGetChildById("fightOffensiveBox")
	fightBalancedBox = inventoryWindow:recursiveGetChildById("fightBalancedBox")
	fightDefensiveBox = inventoryWindow:recursiveGetChildById("fightDefensiveBox")
	chaseModeStandBox = inventoryWindow:recursiveGetChildById("chaseModeBoxStand")
	chaseModeChaseBox = inventoryWindow:recursiveGetChildById("chaseModeBoxChase")
	chaseModeButton = inventoryWindow:recursiveGetChildById("chaseModeBox")
	safeFightButton = inventoryWindow:recursiveGetChildById("safeFightBox")
	buttonPvp = inventoryWindow:recursiveGetChildById("buttonPvp")
	mountButton = inventoryWindow:recursiveGetChildById("mountButton")
	mountButton.onClick = onMountButtonClick
	whiteDoveBox = inventoryWindow:recursiveGetChildById("whiteDoveBox")
	whiteHandBox = inventoryWindow:recursiveGetChildById("whiteHandBox")
	yellowHandBox = inventoryWindow:recursiveGetChildById("yellowHandBox")
	redFistBox = inventoryWindow:recursiveGetChildById("redFistBox")
	fightModeRadioGroup = UIRadioGroup.create()

	fightModeRadioGroup:addWidget(fightOffensiveBox)
	fightModeRadioGroup:addWidget(fightBalancedBox)
	fightModeRadioGroup:addWidget(fightDefensiveBox)

	chaseModeRadioGroup = UIRadioGroup.create()

	chaseModeRadioGroup:addWidget(chaseModeStandBox)
	chaseModeRadioGroup:addWidget(chaseModeChaseBox)
	connect(fightModeRadioGroup, {
		onSelectionChange = onSetFightMode
	})
	connect(chaseModeRadioGroup, {
		onSelectionChange = onSetChaseMode
	})
	connect(safeFightButton, {
		onCheckChange = onSetSafeFight
	})

	if buttonPvp then
		connect(buttonPvp, {
			onClick = onSetSafeFight2
		})
	end

	connect(g_game, {
		onGameStart = online,
		onGameEnd = offline,
		onFightModeChange = update,
		onChaseModeChange = update,
		onSafeFightChange = update,
		onPVPModeChange = update,
		onWalk = check,
		onAutoWalk = check
	})
	connect(LocalPlayer, {
		onOutfitChange = onOutfitChange
	})

	if g_game.isOnline() then
		online()
	end

	soulLabel = inventoryWindow:recursiveGetChildById("soulLabel")
	capLabel = inventoryWindow:recursiveGetChildById("capLabel")
	conditionPanel = inventoryWindow:recursiveGetChildById("conditionPanel")

	connect(LocalPlayer, {
		onStatesChange = onStatesChange,
		onSoulChange = onSoulChange,
		onFreeCapacityChange = onFreeCapacityChange
	})
	connect(LocalPlayer, {
		onSkullChange = onSkullChange
	})
	refresh()
	inventoryWindow:setup()
	inventoryWindow:open()
end

function terminate()
	disconnect(LocalPlayer, {
		onInventoryChange = onInventoryChange,
		onBlessingsChange = onBlessingsChange
	})
	disconnect(g_game, {
		onGameStart = refresh
	})

	if g_game.isOnline() then
		offline()
	end

	fightModeRadioGroup:destroy()
	disconnect(g_game, {
		onGameStart = online,
		onGameEnd = offline,
		onFightModeChange = update,
		onChaseModeChange = update,
		onSafeFightChange = update,
		onPVPModeChange = update,
		onWalk = check,
		onAutoWalk = check
	})
	disconnect(LocalPlayer, {
		onOutfitChange = onOutfitChange
	})
	disconnect(LocalPlayer, {
		onStatesChange = onStatesChange,
		onSoulChange = onSoulChange,
		onFreeCapacityChange = onFreeCapacityChange
	})
	disconnect(LocalPlayer, {
		onSkullChange = onSkullChange
	})
	inventoryWindow:destroy()

	if inventoryButton then
		inventoryButton:destroy()
	end
end

function toggleAdventurerStyle(hasBlessing)
	for slot = InventorySlotFirst, InventorySlotLast do
		local itemWidget = inventoryPanel:getChildById("slot" .. slot)

		if itemWidget then
			itemWidget:setOn(hasBlessing)
		end
	end
end

function refresh()
	local player = g_game.getLocalPlayer()

	for i = InventorySlotFirst, InventorySlotPurse do
		if g_game.isOnline() then
			onInventoryChange(player, i, player:getInventoryItem(i))
		else
			onInventoryChange(player, i, nil)
		end

		toggleAdventurerStyle(player and Bit.hasBit(player:getBlessings(), Blessings.Adventurer) or false)
	end

	if player then
		onSoulChange(player, player:getSoul())
		onFreeCapacityChange(player, player:getFreeCapacity())
		onStatesChange(player, player:getStates(), 0)
	end

	purseButton:setVisible(g_game.getFeature(GamePurseSlot))
end

function toggle()
	if not inventoryButton then
		return
	end

	if inventoryButton:isOn() then
		inventoryWindow:close()
		inventoryButton:setOn(false)
	else
		inventoryWindow:open()
		inventoryButton:setOn(true)
	end
end

function onMiniWindowClose()
	if not inventoryButton then
		return
	end

	inventoryButton:setOn(false)
end

function onInventoryChange(player, slot, item, oldItem)
	if InventorySlotPurse < slot then
		return
	end

	if slot == InventorySlotPurse then
		if g_game.getFeature(GamePurseSlot) then
			-- Nothing
		end

		return
	end

	local itemWidget = inventoryPanel:getChildById("slot" .. slot)

	if item then
		itemWidget:setStyle("InventoryItem")
		itemWidget:setItem(item)
	else
		itemWidget:setStyle(InventorySlotStyles[slot])
		itemWidget:setItem(nil)
	end
end

function onBlessingsChange(player, blessings, oldBlessings)
	local hasAdventurerBlessing = Bit.hasBit(blessings, Blessings.Adventurer)

	if hasAdventurerBlessing ~= Bit.hasBit(oldBlessings, Blessings.Adventurer) then
		toggleAdventurerStyle(hasAdventurerBlessing)
	end
end

function update()
	local fightMode = g_game.getFightMode()

	if fightMode == FightOffensive then
		fightModeRadioGroup:selectWidget(fightOffensiveBox)
	elseif fightMode == FightBalanced then
		fightModeRadioGroup:selectWidget(fightBalancedBox)
	else
		fightModeRadioGroup:selectWidget(fightDefensiveBox)
	end

	local chaseMode = g_game.getChaseMode()

	if chaseMode == ChaseOpponent then
		chaseModeRadioGroup:selectWidget(chaseModeChaseBox)
	else
		chaseModeRadioGroup:selectWidget(chaseModeStandBox)
	end

	local safeFight = g_game.isSafeFight()

	safeFightButton:setChecked(not safeFight)

	if buttonPvp then
		if safeFight then
			buttonPvp:setOn(false)
		else
			buttonPvp:setOn(true)
		end
	end

	if g_game.getFeature(GamePVPMode) then
		local pvpMode = g_game.getPVPMode()
		local pvpWidget = getPVPBoxByMode(pvpMode)
	end
end

function check()
	if modules.client_options.getOption("autoChaseOverride") and g_game.isAttacking() and g_game.getChaseMode() == ChaseOpponent then
		g_game.setChaseMode(DontChase)
	end
end

function online()
	local player = g_game.getLocalPlayer()

	if player then
		local char = g_game.getCharacterName()
		local lastCombatControls = g_settings.getNode("LastCombatControls")

		if not table.empty(lastCombatControls) and lastCombatControls[char] then
			g_game.setFightMode(lastCombatControls[char].fightMode)
			g_game.setChaseMode(lastCombatControls[char].chaseMode)
			g_game.setSafeFight(lastCombatControls[char].safeFight)

			if lastCombatControls[char].pvpMode then
				g_game.setPVPMode(lastCombatControls[char].pvpMode)
			end
		end

		if g_game.getFeature(GamePlayerMounts) then
			mountButton:setVisible(true)
			mountButton:setChecked(player:isMounted())
		else
			mountButton:setVisible(false)
		end
	end

	update()
end

function offline()
	local lastCombatControls = g_settings.getNode("LastCombatControls")
	lastCombatControls = lastCombatControls or {}

	conditionPanel:destroyChildren()

	local player = g_game.getLocalPlayer()

	if player then
		local char = g_game.getCharacterName()
		lastCombatControls[char] = {
			fightMode = g_game.getFightMode(),
			chaseMode = g_game.getChaseMode(),
			safeFight = g_game.isSafeFight()
		}

		if g_game.getFeature(GamePVPMode) then
			lastCombatControls[char].pvpMode = g_game.getPVPMode()
		end

		g_settings.setNode("LastCombatControls", lastCombatControls)
	end
end

function onSetFightMode(self, selectedFightButton)
	if selectedFightButton == nil then
		return
	end

	local buttonId = selectedFightButton:getId()
	local fightMode = nil

	if buttonId == "fightOffensiveBox" then
		fightMode = FightOffensive
	elseif buttonId == "fightBalancedBox" then
		fightMode = FightBalanced
	else
		fightMode = FightDefensive
	end

	g_game.setFightMode(fightMode)
end

function onSetChaseMode(self, selectedButton)
	if selectedButton == nil then
		return
	end

	local buttonId = selectedButton:getId()
	local chaseMode = nil

	if buttonId == "chaseModeBoxChase" then
		chaseMode = ChaseOpponent
	else
		chaseMode = DontChase
	end

	g_game.setChaseMode(chaseMode)
end

function onSetSafeFight(self, checked)
	g_game.setSafeFight(not checked)

	if buttonPvp then
		if not checked then
			buttonPvp:setOn(false)
		else
			buttonPvp:setOn(true)
		end
	end
end

function onSetSafeFight2(self)
	onSetSafeFight(self, not safeFightButton:isChecked())
end

function onSetPVPMode(self, selectedPVPButton)
	if selectedPVPButton == nil then
		return
	end

	local buttonId = selectedPVPButton:getId()
	local pvpMode = PVPWhiteDove

	if buttonId == "whiteDoveBox" then
		pvpMode = PVPWhiteDove
	elseif buttonId == "whiteHandBox" then
		pvpMode = PVPWhiteHand
	elseif buttonId == "yellowHandBox" then
		pvpMode = PVPYellowHand
	elseif buttonId == "redFistBox" then
		pvpMode = PVPRedFist
	end

	g_game.setPVPMode(pvpMode)
end

function onMountButtonClick(self, mousePos)
	local player = g_game.getLocalPlayer()

	if player then
		player:toggleMount()
	end
end

function onOutfitChange(localPlayer, outfit, oldOutfit)
	if outfit.mount == oldOutfit.mount then
		return
	end

	mountButton:setChecked(outfit.mount ~= nil and outfit.mount > 0)
end

function getPVPBoxByMode(mode)
	local widget = nil

	if mode == PVPWhiteDove then
		widget = whiteDoveBox
	elseif mode == PVPWhiteHand then
		widget = whiteHandBox
	elseif mode == PVPYellowHand then
		widget = yellowHandBox
	elseif mode == PVPRedFist then
		widget = redFistBox
	end

	return widget
end

function toggleIcon(bitChanged)
	local icon = conditionPanel:getChildById(Icons[bitChanged].id)

	if icon then
		icon:destroy()
	else
		if bitChanged == PlayerStates.Swords then
			if conditionPanel:getChildById(Icons[PlayerStates.PzBlock].id) then
				return
			end
		elseif bitChanged == PlayerStates.PzBlock then
			local swordsIcon = conditionPanel:getChildById(Icons[PlayerStates.Swords].id)

			if swordsIcon then
				swordsIcon:destroy()
			end
		end

		icon = loadIcon(bitChanged)

		icon:setParent(conditionPanel)
	end
end

function loadIcon(bitChanged)
	local icon = g_ui.createWidget("ConditionWidget", conditionPanel)

	icon:setId(Icons[bitChanged].id)
	icon:setImageSource(Icons[bitChanged].path)
	icon:setTooltip(Icons[bitChanged].tooltip)

	return icon
end

function onSoulChange(localPlayer, soul)
	if not soul then
		return
	end

	soulLabel:setText(tr("Soul") .. ":\n" .. soul)
end

function onFreeCapacityChange(player, freeCapacity)
	if not freeCapacity then
		return
	end

	if freeCapacity > 100000 then
		freeCapacity = 0
	end

	freeCapacity = math.floor(freeCapacity)

	if freeCapacity > 99999 then
		freeCapacity = math.min(9999, math.floor(freeCapacity / 1000)) .. "k"
	end

	capLabel:setText(tr("Cap") .. ":\n" .. freeCapacity)
end

function onStatesChange(localPlayer, now, old)
	if now == old then
		return
	end

	local bitsChanged = bit32.bxor(now, old)

	for i = 1, 32 do
		local pow = math.pow(2, i - 1)

		if bitsChanged < pow then
			break
		end

		local bitChanged = bit32.band(bitsChanged, pow)

		if bitChanged ~= 0 then
			toggleIcon(bitChanged)
		end
	end
end

function onSkullChange(localPlayer, skull)
	local icon = conditionPanel:getChildById("skullIcon")

	if skull < SkullGreen then
		if icon then
			icon:destroy()
		end

		return
	end

	if SkullGreen <= skull or skull <= SkullRed then
		local skullIcon = SkullIcons[skull]
		icon = icon or g_ui.createWidget("ConditionWidget", conditionPanel)

		icon:setId(skullIcon.id)
		icon:setImageSource(skullIcon.path)
		icon:setTooltip(skullIcon.tooltip)

		return
	end
end
