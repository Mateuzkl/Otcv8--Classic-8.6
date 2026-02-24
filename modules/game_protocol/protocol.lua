local registredOpcodes = nil
local ServerPackets = {
	CyclopediaCharacterInfo = 218,
	TournamentLeaderBoard = 197,
	LootContainer = 192,
	LootStats = 207,
	ClientCheck = 99,
	GameNews = 152,
	PartyAnalyzer = 43,
	UpdateCoinBalance = 223,
	isUpdateCoinBalance = 242,
	SpecialContainer = 42,
	KillTracker = 209,
	UpdateSupplyTracker = 206,
	UpdateTrackerAnalyzer = 204,
	UpdateLootTracker = 207,
	OpenStashSupply = 41,
	BestiaryTrackerTab = 185,
	BestiaryTracker = 217,
	BestiaryCharmsData = 216,
	BestiaryMonsterData = 215,
	BestiaryOverview = 214,
	BestiaryData = 213,
	RestingAreaState = 169,
	DailyRewardHistory = 229,
	DailyRewardBasic = 228,
	CloseRewardWall = 227,
	OpenRewardWall = 226,
	DailyRewardCollectionState = 222,
	TeamFinderLeader = 44,
	TeamFinderList = 45,
	Inspection = 118,
	Highscores = 177,
	Tutorial = 220
}
local DAILY_REWARD_TYPE_ITEM = 1
local DAILY_REWARD_TYPE_STORAGE = 2
local DAILY_REWARD_TYPE_PREY_REROLL = 3
local DAILY_REWARD_TYPE_XP_BOOST = 4
local DAILY_REWARD_SYSTEM_SKIP = 1
local DAILY_REWARD_SYSTEM_TYPE_ONE = 1
local DAILY_REWARD_SYSTEM_TYPE_TWO = 2
local DAILY_REWARD_SYSTEM_TYPE_OTHER = 1
local DAILY_REWARD_SYSTEM_TYPE_PREY_REROLL = 2
local DAILY_REWARD_SYSTEM_TYPE_XP_BOOST = 3

function init()
	connect(g_game, {
		onEnterGame = registerProtocol,
		onPendingGame = registerProtocol,
		onGameEnd = unregisterProtocol
	})

	if g_game.isOnline() then
		registerProtocol()
	end
end

function terminate()
	disconnect(g_game, {
		onEnterGame = registerProtocol,
		onPendingGame = registerProtocol,
		onGameEnd = unregisterProtocol
	})
	unregisterProtocol()
end

function registerProtocol()
	if registredOpcodes ~= nil or not g_game.getFeature(GameTibia12Protocol) then
		return
	end

	registredOpcodes = {}

	registerOpcode(ServerPackets.TeamFinderLeader, function (protocol, msg)
		local bool = msg:getU8()

		if bool > 0 then
			return
		end

		msg:getU16()
		msg:getU16()
		msg:getU8()
		msg:getU16()
		msg:getU16()
		msg:getU32()

		local type = msg:getU8()

		msg:getU16()

		if type == 2 then
			msg:getU16()
		end

		local size = msg:getU16()

		for i = 1, size do
			msg:getU32()
			msg:getString()
			msg:getU16()
			msg:getU8()
			msg:getU8()
		end
	end)
	registerOpcode(ServerPackets.TeamFinderList, function (protocol, msg)
		msg:getU8()

		local size = msg:getU32()

		for i = 1, size do
			msg:getU32()
			msg:addString()
			msg:getU16()
			msg:getU16()
			msg:getU8()
			msg:getU16()
			msg:getU16()
			msg:getU32()

			local type = msg:getU8()

			msg:getU16()

			if type == 2 then
				msg:getU16()
			end

			msg:getU8()
		end
	end)
	registerOpcode(ServerPackets.Inspection, function (protocol, msg)
		local bool = msg:getU8()

		if g_game.getProtocolVersion() >= 1230 then
			msg:getU8()
		end

		local size = msg:getU8()

		for i = 1, size do
			if bool > 0 then
				msg:getU8()
			end

			msg:getString()
			readAddItem(msg)

			local size_2 = msg:getU8()

			for u = 1, size_2 do
				msg:getU16()
			end

			local size_3 = msg:getU8()

			for j = 1, size_3 do
				msg:getString()
				msg:getString()
			end
		end

		if bool > 0 then
			msg:getString()

			local outfit = msg:getU16()

			if outfit ~= 0 then
				msg:getU8()
				msg:getU8()
				msg:getU8()
				msg:getU8()
				msg:getU8()
			else
				msg:getU16()
			end

			local size_4 = msg:getU8()

			for l = 1, size_4 do
				msg:getString()
				msg:getString()
			end
		end
	end)
	registerOpcode(ServerPackets.Highscores, function (protocol, msg)
		msg:getU8()

		local size = msg:getU8()

		for i = 1, size do
			msg:getString()
		end

		msg:getString()

		local size_2 = msg:getU8()

		for u = 1, size_2 do
			msg:getU32()
			msg:getString()
		end

		msg:getU32()

		local size_3 = msg:getU8()

		for j = 1, size_3 do
			msg:getU8()
			msg:getString()
		end

		msg:getU8()
		msg:getU16()
		msg:getU16()

		local size_4 = msg:getU8()

		for l = 1, size_4 do
			msg:getU32()
			msg:getString()
			msg:getString()
			msg:getU8()
			msg:getString()
			msg:getU16()
			msg:getU8()
			msg:getU64()
		end

		msg:getU8()
		msg:getU8()
		msg:getU8()
		msg:getU32()
	end)
	registerOpcode(ServerPackets.Tutorial, function (protocol, msg)
		msg:getU8()
	end)
	registerOpcode(ServerPackets.CyclopediaCharacterInfo, function (protocol, msg)
		local type = msg:getU8()

		if g_game.getProtocolVersion() >= 1215 then
			local error = msg:getU8()

			if error > 0 then
				-- Nothing
			end
		end

		if type == 0 then
			msg:getString()
			msg:getString()
			msg:getU16()

			local outfit = msg:getU16()

			if outfit ~= 0 then
				msg:getU8()
				msg:getU8()
				msg:getU8()
				msg:getU8()
				msg:getU8()
			else
				msg:getU16()
			end

			if g_game.getProtocolVersion() >= 1220 then
				msg:getU8()
				msg:getString()
			end
		elseif type == 1 then
			msg:getU64()
			msg:getU16()
			msg:getU8()
			msg:getU16()
			msg:getU32()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU8()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU8()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU32()
			msg:getU32()
			msg:getU32()

			local size = msg:getU8()

			for i = 1, size do
				msg:getU8()
				msg:getU16()
				msg:getU16()
				msg:getU16()
				msg:getU16()
			end

			if g_game.getProtocolVersion() < 1215 then
				msg:getU16()
				msg:getString()
				msg:getString()
				msg:getU16()

				local outfit = msg:getU16()

				if outfit ~= 0 then
					msg:getU8()
					msg:getU8()
					msg:getU8()
					msg:getU8()
					msg:getU8()
				else
					msg:getU16()
				end
			end
		elseif type == 2 then
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU8()
			msg:getU8()
			msg:getU16()
			msg:getU8()
			msg:getU8()
			msg:getU8()
			msg:getU16()
			msg:getU16()

			local size = msg:getU8()

			for i = 1, size do
				msg:getU8()
				msg:getU8()
			end
		elseif type == 3 then
			msg:getU16()
			msg:getU16()

			local size = msg:getU16()

			for i = 1, size do
				msg:getU32()
				msg:getString()
			end
		elseif type == 4 then
			msg:getU16()
			msg:getU16()

			local size = msg:getU16()

			for i = 1, size do
				msg:getU32()
				msg:getString()
				msg:getU8()
			end
		elseif type == 5 then
			msg:getU16()
			msg:getU16()

			local size = msg:getU16()

			for i = 1, size do
				msg:getU16()
				msg:getU32()

				local size_2 = msg:getU8()

				if size_2 > 0 then
					msg:getString()
					msg:getString()
					msg:getU8()
				end
			end
		elseif type == 6 then
			local size = msg:getU16()

			for i = 1, size do
				msg:getU16()
				msg:getU32()
			end
		elseif type == 7 then
			local size = msg:getU16()

			for i = 1, size do
				msg:getU16()
				msg:getString()
				msg:getU8()
				msg:getU8()
				msg:getU32()
			end

			msg:getU8()
			msg:getU8()
			msg:getU8()
			msg:getU8()

			local size_2 = msg:getU16()

			for u = 1, size_2 do
				msg:getU16()
				msg:getString()
				msg:getU8()
				msg:getU8()
				msg:getU32()
			end

			if g_game.getProtocolVersion() >= 1260 then
				msg:getU8()
				msg:getU8()
				msg:getU8()
				msg:getU8()
			end
		elseif type == 8 then
			msg:getU32()
			msg:getU32()

			local size = msg:getU8()

			for i = 1, size do
				msg:getString()
				msg:getU8()
			end

			msg:getU8()
			msg:getU8()
			msg:getU8()
			msg:getU8()
			msg:getU8()

			local size_2 = msg:getU8()

			for u = 1, size_2 do
				msg:getU8()
			end

			local size_3 = msg:getU8()

			for j = 1, size_3 do
				msg:getU8()
			end

			msg:getU16()
		elseif type == 9 then
			local size = msg:getU8()

			for i = 1, size do
				msg:getU8()
				msg:getString()
				readAddItem(msg)

				local size_2 = msg:getU8()

				for u = 1, size_2 do
					msg:getU16()
				end

				local size_3 = msg:getU8()

				for j = 1, size_3 do
					msg:getString()
					msg:getString()
				end
			end

			msg:getString()

			local outfit = msg:getU16()

			if outfit ~= 0 then
				msg:getU8()
				msg:getU8()
				msg:getU8()
				msg:getU8()
				msg:getU8()
			else
				msg:getU16()
			end

			local size_4 = msg:getU8()

			for k = 1, size_4 do
				msg:getString()
				msg:getString()
			end
		elseif type == 10 then
			local bool = msg:getU8()

			if bool > 0 then
				msg:getU8()
				msg:getU8()
				msg:getString()

				local size = msg:getU8()

				for i = 1, size do
					msg:getU32()
					msg:getString()
				end
			end
		elseif type == 11 then
			msg:getU8()

			local size = msg:getU8()

			for i = 1, size do
				msg:getU8()
				msg:getString()
				msg:getString()
				msg:getU8()
				msg:getU8()
			end
		end
	end)
	registerOpcode(ServerPackets.TournamentLeaderBoard, function (protocol, msg)
		msg:getU16()

		local capacity = msg:getU8()

		for i = 1, capacity do
			msg:getString()
		end

		msg:getString()
		msg:getU16()
		msg:getU16()
		msg:getU16()

		local size = msg:getU8()

		for u = 1, size do
			msg:getU32()
			msg:getU32()
			msg:getString()
			msg:getU8()
			msg:getU64()
			msg:getU8()
			msg:getU8()
		end

		msg:getU8()
		msg:getString()
	end)
	registerOpcode(ServerPackets.LootContainer, function (protocol, msg)
		msg:getU8()

		local size = msg:getU8()

		for i = 1, size do
			msg:getU8()
			msg:getU16()
		end
	end)
	registerOpcode(ServerPackets.LootStats, function (protocol, msg)
		readAddItem(msg)
		msg:getString()
	end)
	registerOpcode(ServerPackets.ClientCheck, function (protocol, msg)
		local size = msg:getU32()

		for i = 1, size do
			msg:getU8()
		end
	end)
	registerOpcode(ServerPackets.GameNews, function (protocol, msg)
		msg:getU32()
		msg:getU8()
	end)
	registerOpcode(ServerPackets.PartyAnalyzer, function (protocol, msg)
		msg:getU32()
		msg:getU32()
		msg:getU8()

		local size = msg:getU8()

		for i = 1, size do
			msg:getU32()
			msg:getU8()
			msg:getU64()
			msg:getU64()
			msg:getU64()
			msg:getU64()
		end

		msg:getU8()

		local size_2 = msg:getU8()

		for u = 1, size_2 do
			msg:getU32()
			msg:getString()
		end
	end)
	registerOpcode(ServerPackets.UpdateCoinBalance, function (protocol, msg)
		msg:getU8()
		msg:getU32()
		msg:getU32()

		if g_game.getProtocolVersion() >= 1220 then
			msg:getU32()
			msg:getU32()
		end
	end)
	registerOpcode(ServerPackets.isUpdateCoinBalance, function (protocol, msg)
		msg:getU8()
	end)
	registerOpcode(ServerPackets.SpecialContainer, function (protocol, msg)
		local supplyStashMenu = msg:getU8()
		local marketMenu = msg:getU8()
	end)
	registerOpcode(ServerPackets.KillTracker, function (protocol, msg)
		msg:getString()
		msg:getU16()
		msg:getU8()
		msg:getU8()
		msg:getU8()
		msg:getU8()
		msg:getU8()

		local size = msg:getU8()

		if size > 0 then
			for i = 1, size do
				readAddItem(msg)
			end
		end
	end)
	registerOpcode(ServerPackets.UpdateSupplyTracker, function (protocol, msg)
		msg:getU16()
	end)
	registerOpcode(ServerPackets.UpdateTrackerAnalyzer, function (protocol, msg)
		local type = msg:getU8()

		msg:getU32()

		if type > 0 then
			msg:getU8()

			if type > 1 then
				msg:getString()
			end
		end
	end)
	registerOpcode(ServerPackets.UpdateLootTracker, function (protocol, msg)
		readAddItem(msg)
		msg:getString()
	end)
	registerOpcode(ServerPackets.OpenStashSupply, function (protocol, msg)
		local count = msg:getU16()

		for i = 1, count do
			msg:getU16()
			msg:getU32()
		end

		msg:getU16()
	end)
	registerOpcode(ServerPackets.OpenRewardWall, function (protocol, msg)
		msg:getU8()
		msg:getU32()
		msg:getU8()

		local taken = msg:getU8()

		if taken > 0 then
			msg:getString()
		end

		msg:getU32()
		msg:getU16()
		msg:getU16()
	end)
	registerOpcode(ServerPackets.CloseRewardWall, function (protocol, msg)
	end)
	registerOpcode(ServerPackets.DailyRewardBasic, function (protocol, msg)
		local count = msg:getU8()

		for i = 1, count do
			readDailyReward(msg)
			readDailyReward(msg)
		end

		local maxBonus = msg:getU8()

		for i = 1, maxBonus do
			msg:getString()
			msg:getU8()
		end

		msg:getU8()
	end)
	registerOpcode(ServerPackets.DailyRewardHistory, function (protocol, msg)
		local count = msg:getU8()

		for i = 1, count do
			msg:getU32()
			msg:getU8()
			msg:getString()
			msg:getU16()
		end
	end)
	registerOpcode(ServerPackets.BestiaryTrackerTab, function (protocol, msg)
		local count = msg:getU8()

		for i = 1, count do
			msg:getU16()
			msg:getU32()
			msg:getU16()
			msg:getU16()
			msg:getU16()
			msg:getU8()
		end
	end)
end

function readAddItem(msg)
	msg:getU16()

	if g_game.getProtocolVersion() < 1150 then
		msg:getU8()
	end

	local var = msg:getU8()

	if g_game.getProtocolVersion() > 1150 then
		if var == 1 then
			msg:getU32()
		end

		if g_game.getProtocolVersion() >= 1260 then
			local isQuiver = msg:getU8()

			if isQuiver == 1 then
				msg:getU32()
			end
		end
	else
		msg:getU8()
	end
end

function unregisterProtocol()
	if registredOpcodes == nil then
		return
	end

	for _, opcode in ipairs(registredOpcodes) do
		ProtocolGame.unregisterOpcode(opcode)
	end

	registredOpcodes = nil
end

function registerOpcode(code, func)
	if registredOpcodes[code] ~= nil then
		error("Duplicated registed opcode: " .. code)
	end

	registredOpcodes[code] = func

	ProtocolGame.registerOpcode(code, func)
end

function readDailyReward(msg)
	local systemType = msg:getU8()

	if systemType == 1 then
		msg:getU8()

		local count = msg:getU8()

		for i = 1, count do
			msg:getU16()
			msg:getString()
			msg:getU32()
		end
	elseif systemType == 2 then
		msg:getU8()

		local type = msg:getU8()

		if type == DAILY_REWARD_SYSTEM_TYPE_PREY_REROLL then
			msg:getU8()
		elseif type == DAILY_REWARD_SYSTEM_TYPE_XP_BOOST then
			msg:getU16()
		end
	end
end
