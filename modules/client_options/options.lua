local defaultOptions = {
	showTooltips = false,
	turnDelay = 30,
	dontStretchShrink = false,
	displayText = true,
	topHealtManaBar = false,
	highlightThingsUnderCursor = false,
	hidePlayerBars = true,
	fullscreen = false,
	showPing = true,
	showFps = true,
	vsync = true,
	displayNames = true,
	ambientLight = 0,
	crosshair = 1,
	floorFading = 500,
	botSoundVolume = 0,
	musicSoundVolume = 0,
	enableMusicSound = false,
	enableAudio = false,
	backgroundFrameRate = 60,
	containerPanel = 8,
	leftPanels = 0,
	rightPanels = 1,
	showPrivateMessagesOnScreen = true,
	showPrivateMessagesInConsole = true,
	showLevelsInConsole = true,
	showTimestampsInConsole = true,
	showInfoMessagesInConsole = true,
	showEventMessagesInConsole = true,
	showStatusMessagesInConsole = true,
	autoChaseOverride = true,
	smoothWalking = false,
	dash = false,
	smartWalk = false,
	showHealthManaCircle = false,
	displayHealthOnTop = false,
	classicView = true,
	displayMana = true,
	displayHealth = true,
	hotkeyDelay = 30,
	optimizationLevel = 1,
	antialiasing = true,
	profile = 1,
	actionbarLock = false,
	actionbar9 = false,
	actionbar8 = false,
	actionbar7 = false,
	actionbar6 = false,
	actionbar5 = false,
	actionbar4 = false,
	actionbar3 = false,
	actionbar2 = false,
	actionbar1 = false,
	topBar = false,
	walkCtrlTurnDelay = 150,
	walkTeleportDelay = 200,
	walkStairsDelay = 50,
	walkTurnDelay = 100,
	walkFirstStepDelay = 200,
	moveFullStack = true,
	wsadWalking = false,
	layout = DEFAULT_LAYOUT,
	cacheMap = g_app.isMobile(),
	classicControl = not g_app.isMobile()
}
optionsWindow = nil
optionsButton = nil
optionsTabBar = nil
options = {}
extraOptions = {}
generalPanel = nil
generalTab = nil
interfacePanel = nil
interfaceTab = nil
consolePanel = nil
consoleTab = nil
graphicsPanel = nil
graphicsTab = nil
helpPanel = nil
helpTab = nil
hotkeyPanel = nil
hotkeyTab = nil
customPanel = nil
extrasPanel = nil
audioButton = nil
local helpCategories = {
	{
		name = "Emotes",
		text = ""
	},
	{
		name = "Colored Text",
		text = [[
You can choose from a wide range of color options, including hexadecimal values or predefined color names.

To color your text using BBCode, simply use the following format:

- Hexadecimal Color Code: [color=#FF0000]Text[/color]

]] .. [[
Replace "#FF0000" with the desired hexadecimal color code.

- Predefined Color Name: [color=blue]Text[/color]

Replace "blue" with the name of the color you wish to use.

For example, if you want to color your text red, you can use either ]] .. [[
of the following formats:

- [color=#FF0000]Hello, adventurers![/color]

- [color=red]Hello, adventurers![/color]

]]
	}
}
local emoticonString = "You have access to a variety of emoticons to enhance your communication with other players. Simply include the designated hashtag within your message to display the emoticon." .. "Here's a list of available emoticons and their corresponding hashtags:\n\n"

for _, emoticon in pairs(dofile("/modules/game_console/emoticons.lua")) do
	emoticonString = emoticonString .. emoticon.char .. " - "

	for _, word in pairs(emoticon.words) do
		emoticonString = emoticonString .. "#" .. word .. ", "
	end

	emoticonString = emoticonString:sub(1, -3) .. "\n"
end

helpCategories[1].text = emoticonString

function init()
	for k, v in pairs(defaultOptions) do
		g_settings.setDefault(k, v)

		options[k] = v
	end

	for _, v in ipairs(g_extras.getAll()) do
		extraOptions[v] = g_extras.get(v)

		g_settings.setDefault("extras_" .. v, extraOptions[v])
	end

	optionsWindow = g_ui.displayUI("options")

	optionsWindow:hide()

	optionsTabBar = optionsWindow:getChildById("optionsTabBar")

	optionsTabBar:setContentWidget(optionsWindow:getChildById("optionsTabContent"))
	g_keyboard.bindKeyDown("Ctrl+Shift+F", function ()
		toggleOption("fullscreen")
	end)
	g_keyboard.bindKeyDown("Ctrl+N", toggleDisplays)

	generalPanel = g_ui.loadUI("game")
	generalTab = optionsTabBar:addTab(tr("Game"), generalPanel)
	interfacePanel = g_ui.loadUI("interface")
	interfaceTab = optionsTabBar:addTab(tr("Interface"), interfacePanel)
	consolePanel = g_ui.loadUI("console")
	consoleTab = optionsTabBar:addTab(tr("Console"), consolePanel)
	graphicsPanel = g_ui.loadUI("graphics")
	graphicsTab = optionsTabBar:addTab(tr("Graphics"), graphicsPanel)
	hotkeyPanel = g_ui.loadUI("hotkeys")
	hotkeyTab = optionsTabBar:addTab(tr("Hotkeys"), hotkeyPanel)
	customPanel = g_ui.loadUI("custom")

	optionsTabBar:addTab(tr("Actionbars"), customPanel)

	helpPanel = g_ui.loadUI("help")
	helpTab = optionsTabBar:addTab(tr("Help"), helpPanel)
	helpCategoryComboBox = helpPanel:getChildById("categoryComboBox")
	helpDescription = helpPanel:getChildById("helpDescription")

	for _, category in pairs(helpCategories) do
		helpCategoryComboBox:addOption(category.name)
	end

	extrasPanel = g_ui.createWidget("OptionPanel")

	for _, v in ipairs(g_extras.getAll()) do
		local extrasButton = g_ui.createWidget("OptionCheckBox")

		extrasButton:setId(v)
		extrasButton:setText(g_extras.getDescription(v))
		extrasPanel:addChild(extrasButton)
	end

	if not g_game.getFeature(GameNoDebug) and not g_app.isMobile() then
		-- Nothing
	end

	optionsButton = modules.client_topmenu.addLeftButton("optionsButton", tr("Options"), "/images/topbuttons/options", toggle)
	audioButton = modules.client_topmenu.addLeftButton("audioButton", tr("Audio"), "/images/topbuttons/audio", function ()
		toggleOption("enableAudio")
	end)

	if g_app.isMobile() then
		audioButton:hide()
	end

	addEvent(function ()
		setup()
	end)
	connect(g_game, {
		onGameStart = online,
		onGameEnd = offline
	})
end

function terminate()
	disconnect(g_game, {
		onGameStart = online,
		onGameEnd = offline
	})
	g_keyboard.unbindKeyDown("Ctrl+Shift+F")
	g_keyboard.unbindKeyDown("Ctrl+N")
	optionsWindow:destroy()
	optionsButton:destroy()
	audioButton:destroy()
end

function setup()
	for k, v in pairs(defaultOptions) do
		if type(v) == "boolean" then
			setOption(k, g_settings.getBoolean(k), true)
		elseif type(v) == "number" then
			setOption(k, g_settings.getNumber(k), true)
		elseif type(v) == "string" then
			setOption(k, g_settings.getString(k), true)
		end
	end

	for _, v in ipairs(g_extras.getAll()) do
		g_extras.set(v, g_settings.getBoolean("extras_" .. v))

		local widget = extrasPanel:recursiveGetChildById(v)

		if widget then
			widget:setChecked(g_extras.get(v))
		end
	end

	if g_game.isOnline() then
		online()
	end
end

function toggle()
	if optionsWindow:isVisible() then
		hide()
	else
		show()
	end
end

function show()
	optionsWindow:show()
	optionsWindow:raise()
	optionsWindow:focus()
end

function hide()
	optionsWindow:hide()
end

function cancel()
	optionsWindow:hide()
end

function toggleDisplays()
	if options.displayNames and options.displayHealth and options.displayMana then
		setOption("displayNames", false)
	elseif options.displayHealth then
		setOption("displayHealth", false)
		setOption("displayMana", false)
	elseif not options.displayNames and not options.displayHealth then
		setOption("displayNames", true)
	else
		setOption("displayHealth", true)
		setOption("displayMana", true)
	end
end

function toggleOption(key)
	setOption(key, not getOption(key))
end

function setOption(key, value, force)
	if extraOptions[key] ~= nil then
		g_extras.set(key, value)
		g_settings.set("extras_" .. key, value)

		if key == "debugProxy" and modules.game_proxy then
			if value then
				modules.game_proxy.show()
			else
				modules.game_proxy.hide()
			end
		end

		return
	end

	if modules.game_interface == nil then
		return
	end

	if not force and options[key] == value then
		return
	end

	local gameMapPanel = modules.game_interface.getMapPanel()

	if key == "vsync" then
		g_window.setVerticalSync(value)
	elseif key == "showFps" then
		modules.client_topmenu.setFpsVisible(value)

		if modules.game_stats and modules.game_stats.ui.fps then
			modules.game_stats.ui.fps:setVisible(value)
		end
	elseif key == "showPing" then
		modules.client_topmenu.setPingVisible(value)

		if modules.game_stats and modules.game_stats.ui.ping then
			modules.game_stats.ui.ping:setVisible(value)
		end
	elseif key == "fullscreen" then
		g_window.setFullscreen(value)
	elseif key == "enableAudio" then
		if g_sounds ~= nil then
			g_sounds.setAudioEnabled(value)
		end

		if value then
			audioButton:setIcon("/images/topbuttons/audio")
		else
			audioButton:setIcon("/images/topbuttons/audio_mute")
		end
	elseif key == "backgroundFrameRate" then
		local text = value
		local v = value

		if value <= 0 or value >= 201 then
			text = "max"
			v = 0
		end

		graphicsPanel:getChildById("backgroundFrameRateLabel"):setText(tr("Game framerate limit: %s", text))
		g_app.setMaxFps(v)
	elseif key == "floorFading" then
		gameMapPanel:setFloorFading(value)
		interfacePanel:getChildById("floorFadingLabel"):setText(tr("Floor fading: %s ms", value))
	elseif key == "crosshair" then
		gameMapPanel:setCrosshair("")
	elseif key == "ambientLight" then
		graphicsPanel:getChildById("ambientLightLabel"):setText(tr("Ambient light: %s%%", value))
		gameMapPanel:setMinimumAmbientLight(value / 100)
		gameMapPanel:setDrawLights(value < 100)
	elseif key == "optimizationLevel" then
		g_adaptiveRenderer.setLevel(value - 2)
	elseif key == "displayNames" then
		gameMapPanel:setDrawNames(value)
	elseif key == "displayHealth" then
		gameMapPanel:setDrawHealthBars(value)
	elseif key == "displayMana" then
		gameMapPanel:setDrawManaBar(value)
	elseif key == "displayHealthOnTop" then
		gameMapPanel:setDrawHealthBarsOnTop(value)
	elseif key == "hidePlayerBars" then
		-- Nothing
	elseif key == "topHealtManaBar" then
		-- Nothing
	elseif key == "displayText" then
		gameMapPanel:setDrawTexts(value)
	elseif key == "dontStretchShrink" then
		addEvent(function ()
			modules.game_interface.updateStretchShrink()
		end)
	elseif key == "dash" then
		-- Nothing
	elseif key == "smoothWalking" then
		if value then
			g_game.setMaxPreWalkingSteps(2)
		else
			g_game.setMaxPreWalkingSteps(1)
		end
	elseif key == "wsadWalking" then
		if modules.game_console and modules.game_console.consoleToggleChat:isChecked() ~= value then
			modules.game_console.consoleToggleChat:setChecked(value)
		end
	elseif key == "hotkeyDelay" then
		generalPanel:getChildById("hotkeyDelayLabel"):setText(tr("Hotkey delay: %s ms", value))
	elseif key == "walkFirstStepDelay" then
		generalPanel:getChildById("walkFirstStepDelayLabel"):setText(tr("Walk delay after first step: %s ms", value))
	elseif key == "walkTurnDelay" then
		generalPanel:getChildById("walkTurnDelayLabel"):setText(tr("Walk delay after turn: %s ms", value))
	elseif key == "walkStairsDelay" then
		generalPanel:getChildById("walkStairsDelayLabel"):setText(tr("Walk delay after floor change: %s ms", value))
	elseif key == "walkTeleportDelay" then
		generalPanel:getChildById("walkTeleportDelayLabel"):setText(tr("Walk delay after teleport: %s ms", value))
	elseif key == "walkCtrlTurnDelay" then
		generalPanel:getChildById("walkCtrlTurnDelayLabel"):setText(tr("Walk delay after ctrl turn: %s ms", value))
	elseif key == "antialiasing" then
		g_app.setSmooth(value)
	end

	for _, panel in pairs(optionsTabBar:getTabsPanel()) do
		local widget = panel:recursiveGetChildById(key)

		if widget then
			if widget:getStyle().__class == "UICheckBox" then
				widget:setChecked(value)

				break
			end

			if widget:getStyle().__class == "UIScrollBar" then
				widget:setValue(value)

				break
			end

			if widget:getStyle().__class == "UIComboBox" and type(value) == "string" then
				widget:setCurrentOption(value, true)

				break
			end

			if value == nil or value < 1 then
				value = 1
			end

			if widget.currentIndex ~= value then
				widget:setCurrentIndex(value, true)
			end

			break
		end
	end

	g_settings.set(key, value)

	options[key] = value

	if key == "profile" then
		modules.client_profiles.onProfileChange()
	end

	if key == "classicView" or key == "rightPanels" or key == "leftPanels" or key == "cacheMap" then
		modules.game_interface.refreshViewMode()
	elseif key:find("actionbar") then
		modules.game_actionbar.show()
	end

	if key == "topBar" then
		-- Nothing
	end
end

function getOption(key)
	return options[key]
end

function addTab(name, panel, icon)
	optionsTabBar:addTab(name, panel, icon)
end

function addButton(name, func, icon)
	optionsTabBar:addButton(name, func, icon)
end

function online()
	setLightOptionsVisibility(not g_game.getFeature(GameForceLight))
	g_app.setSmooth(g_settings.getBoolean("antialiasing"))
end

function offline()
	setLightOptionsVisibility(true)
end

function setLightOptionsVisibility(value)
	graphicsPanel:getChildById("ambientLightLabel"):setEnabled(value)
	graphicsPanel:getChildById("ambientLight"):setEnabled(value)
	interfacePanel:getChildById("floorFading"):setEnabled(value)
	interfacePanel:getChildById("floorFadingLabel"):setEnabled(value)
	interfacePanel:getChildById("floorFadingLabel2"):setEnabled(value)
end

function onHelpChange(currentOption, currentIndex)
	helpDescription:setText(helpCategories[currentIndex].text)
end
