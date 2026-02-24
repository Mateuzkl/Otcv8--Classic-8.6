function g_game.getRsa()
	return G.currentRsa
end

function g_game.findPlayerItem(itemId, subType)
	local localPlayer = g_game.getLocalPlayer()

	if localPlayer then
		for slot = InventorySlotFirst, InventorySlotLast do
			local item = localPlayer:getInventoryItem(slot)

			if item and item:getId() == itemId and (subType == -1 or item:getSubType() == subType) then
				return item
			end
		end
	end

	return g_game.findItemInContainers(itemId, subType)
end

function g_game.chooseRsa(host)
	if G.currentRsa ~= CIPSOFT_RSA and G.currentRsa ~= OTSERV_RSA then
		return
	end

	if host:ends(".tibia.com") or host:ends(".cipsoft.com") then
		g_game.setRsa(CIPSOFT_RSA)

		if g_app.getOs() == "windows" then
			g_game.setCustomOs(OsTypes.Windows)
		else
			g_game.setCustomOs(OsTypes.Linux)
		end
	else
		if G.currentRsa == CIPSOFT_RSA then
			g_game.setCustomOs(-1)
		end

		g_game.setRsa(OTSERV_RSA)
	end

	if g_game.getClientVersion() <= 760 then
		g_game.setCustomOs(2)
	end
end

function g_game.setRsa(rsa, e)
	e = e or "65537"

	g_crypt.rsaSetPublicKey(rsa, e)

	G.currentRsa = rsa
end

function g_game.isOfficialTibia()
	return G.currentRsa == CIPSOFT_RSA
end

function g_game.getSupportedClients()
	return {
		740,
		741,
		750,
		760,
		770,
		772,
		780,
		781,
		782,
		790,
		792,
		800,
		810,
		811,
		820,
		821,
		822,
		830,
		831,
		840,
		842,
		850,
		853,
		854,
		855,
		857,
		860,
		861,
		862,
		870,
		871,
		900,
		910,
		920,
		931,
		940,
		943,
		944,
		951,
		952,
		953,
		954,
		960,
		961,
		963,
		970,
		971,
		972,
		973,
		980,
		981,
		982,
		983,
		984,
		985,
		986,
		1000,
		1001,
		1002,
		1010,
		1011,
		1012,
		1013,
		1020,
		1021,
		1022,
		1030,
		1031,
		1032,
		1033,
		1034,
		1035,
		1036,
		1037,
		1038,
		1039,
		1040,
		1041,
		1050,
		1051,
		1052,
		1053,
		1054,
		1055,
		1056,
		1057,
		1058,
		1059,
		1060,
		1061,
		1062,
		1063,
		1064,
		1070,
		1071,
		1072,
		1073,
		1074,
		1075,
		1076,
		1080,
		1081,
		1082,
		1090,
		1091,
		1092,
		1093,
		1094,
		1095,
		1096,
		1097,
		1098,
		1099
	}
end

function g_game.getClientProtocolVersion(client)
	local clients = {
		[982.0] = 974,
		[985.0] = 977,
		[981.0] = 973,
		[983.0] = 975,
		[1001.0] = 979,
		[1002.0] = 980,
		[984.0] = 976,
		[986.0] = 978,
		[980.0] = 971
	}

	return clients[client] or client
end

if not G.currentRsa then
	g_game.setRsa(OTSERV_RSA)
end
