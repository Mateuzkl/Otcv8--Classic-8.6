FloorHigher = 0
FloorLower = 15
SkullNone = 0
SkullYellow = 1
SkullGreen = 2
SkullWhite = 3
SkullRed = 4
SkullBlack = 5
SkullOrange = 6
ShieldNone = 0
ShieldWhiteYellow = 1
ShieldWhiteBlue = 2
ShieldBlue = 3
ShieldYellow = 4
ShieldBlueSharedExp = 5
ShieldYellowSharedExp = 6
ShieldBlueNoSharedExpBlink = 7
ShieldYellowNoSharedExpBlink = 8
ShieldBlueNoSharedExp = 9
ShieldYellowNoSharedExp = 10
ShieldGray = 11
EmblemNone = 0
EmblemGreen = 1
EmblemRed = 2
EmblemBlue = 3
EmblemMember = 4
EmblemOther = 5
VipIconFirst = 0
VipIconLast = 10
Directions = {
	South = 2,
	East = 1,
	North = 0,
	NorthWest = 7,
	SouthWest = 6,
	SouthEast = 5,
	NorthEast = 4,
	West = 3
}
Skill = {
	LifeLeechChance = 9,
	CriticalDamage = 8,
	CriticalChance = 7,
	Fishing = 6,
	Shielding = 5,
	Distance = 4,
	Axe = 3,
	Sword = 2,
	Club = 1,
	Fist = 0,
	ManaLeechAmount = 12,
	ManaLeechChance = 11,
	LifeLeechAmount = 10
}
North = Directions.North
East = Directions.East
South = Directions.South
West = Directions.West
NorthEast = Directions.NorthEast
SouthEast = Directions.SouthEast
SouthWest = Directions.SouthWest
NorthWest = Directions.NorthWest
FightOffensive = 1
FightBalanced = 2
FightDefensive = 3
DontChase = 0
ChaseOpponent = 1
PVPWhiteDove = 0
PVPWhiteHand = 1
PVPYellowHand = 2
PVPRedFist = 3
GameProtocolChecksum = 1
GameAccountNames = 2
GameChallengeOnLogin = 3
GamePenalityOnDeath = 4
GameNameOnNpcTrade = 5
GameDoubleFreeCapacity = 6
GameDoubleExperience = 7
GameTotalCapacity = 8
GameSkillsBase = 9
GamePlayerRegenerationTime = 10
GameChannelPlayerList = 11
GamePlayerMounts = 12
GameEnvironmentEffect = 13
GameCreatureEmblems = 14
GameItemAnimationPhase = 15
GameMagicEffectU16 = 16
GamePlayerMarket = 17
GameSpritesU32 = 18
GameTileAddThingWithStackpos = 19
GameOfflineTrainingTime = 20
GamePurseSlot = 21
GameFormatCreatureName = 22
GameSpellList = 23
GameClientPing = 24
GameExtendedClientPing = 25
GameDoubleHealth = 28
GameDoubleSkills = 29
GameChangeMapAwareRange = 30
GameMapMovePosition = 31
GameAttackSeq = 32
GameBlueNpcNameColor = 33
GameDiagonalAnimatedText = 34
GameLoginPending = 35
GameNewSpeedLaw = 36
GameForceFirstAutoWalkStep = 37
GameMinimapRemove = 38
GameDoubleShopSellAmount = 39
GameContainerPagination = 40
GameThingMarks = 41
GameLooktypeU16 = 42
GamePlayerAddons = 44
GameMessageStatements = 45
GameMessageLevel = 46
GameNewFluids = 47
GamePlayerStateU16 = 48
GameNewOutfitProtocol = 49
GamePVPMode = 50
GameWritableDate = 51
GameAdditionalVipInfo = 52
GameBaseSkillU16 = 53
GameCreatureIcons = 54
GameHideNpcNames = 55
GameSpritesAlphaChannel = 56
GamePremiumExpiration = 57
GameBrowseField = 58
GameEnhancedAnimations = 59
GameOGLInformation = 60
GameMessageSizeCheck = 61
GamePreviewState = 62
GameLoginPacketEncryption = 63
GameClientVersion = 64
GameContentRevision = 65
GameExperienceBonus = 66
GameAuthenticator = 67
GameUnjustifiedPoints = 68
GameSessionKey = 69
GameDeathType = 70
GameIdleAnimations = 71
GameKeepUnawareTiles = 72
GameIngameStore = 73
GameIngameStoreHighlights = 74
GameIngameStoreServiceType = 75
GameAdditionalSkills = 76
GameDistanceEffectU16 = 77
GamePrey = 78
GameDoubleMagicLevel = 79
GameExtendedOpcode = 80
GameMinimapLimitedToSingleFloor = 81
GameSendWorldName = 82
GameDoubleLevel = 83
GameDoubleSoul = 84
GameDoublePlayerGoodsMoney = 85
GameCreatureWalkthrough = 86
GameDoubleTradeMoney = 87
GameSequencedPackets = 88
GameTibia12Protocol = 89
GameNewWalking = 90
GameSlowerManualWalking = 91
GameItemTooltip = 93
GameBot = 95
GameBiggerMapCache = 96
GameForceLight = 97
GameNoDebug = 98
GameBotProtection = 99
GameCreatureDirectionPassable = 100
GameFasterAnimations = 101
GameCenteredOutfits = 102
GameSendIdentifiers = 103
GameWingsAndAura = 104
GamePlayerStateU32 = 105
GameOutfitShaders = 106
GameForceAllowItemHotkeys = 107
GameCountU16 = 108
GameDrawAuraOnTop = 109
GamePacketSizeU32 = 110
GamePacketCompression = 111
GameOldInformationBar = 112
GameHealthInfoBackground = 113
GameWingOffset = 114
GameAuraFrontAndBack = 115
GameMapDrawGroundFirst = 116
GameMapIgnoreCorpseCorrection = 117
GameDontCacheFiles = 118
GameBigAurasCenter = 119
GameNewUpdateWalk = 120
GameNewCreatureStacking = 121
GameCreaturesMana = 122
GameQuickLootFlags = 123
GameDontMergeAnimatedText = 124
GameMissionId = 125
GameItemCustomAttributes = 126
GameAnimatedTextCustomFont = 127
GameDrawFloorShadow = 128
GameItemName = 129
GameItemAbilityTier = 130
LastGameFeature = 131
TextColors = {
	green = "#00EB00",
	lightblue = "#5ff7f7",
	yellow = "#ffff00",
	blue = "#9f9dfd",
	orange = "#f36500",
	white = "#ffffff",
	red = "#f55e5e"
}
MessageModes = {
	GamemasterPrivateTo = 15,
	GamemasterPrivateFrom = 14,
	GamemasterChannel = 13,
	GamemasterBroadcast = 12,
	NpcTo = 11,
	NpcFrom = 10,
	Spell = 9,
	ChannelHighlight = 8,
	Channel = 7,
	ChannelManagement = 6,
	PrivateTo = 5,
	PrivateFrom = 4,
	Yell = 3,
	Whisper = 2,
	Say = 1,
	None = 0,
	Invalid = 255,
	Last = 52,
	NpcFromStartBlock = 51,
	GameHighlight = 50,
	RVRContinue = 49,
	RVRAnswer = 48,
	RVRChannel = 47,
	Blue = 46,
	Red = 45,
	MonsterSay = 44,
	MonsterYell = 43,
	BeyondLast = 42,
	Mana = 41,
	Market = 40,
	Thankyou = 39,
	TutorialHint = 38,
	HotkeyUse = 37,
	Report = 36,
	BarkLoud = 35,
	BarkLow = 34,
	Party = 33,
	PartyManagement = 32,
	Guild = 31,
	TradeNpc = 30,
	Loot = 29,
	Status = 28,
	ExpOthers = 27,
	HealOthers = 26,
	DamageOthers = 25,
	Exp = 24,
	Heal = 23,
	DamageReceived = 22,
	DamageDealed = 21,
	Look = 20,
	Failure = 19,
	Game = 18,
	Warning = 17,
	Login = 16
}
OTSERV_RSA  = "1091201329673994292788609605089955415282375029027981291234687579" ..
              "3726629149257644633073969600111060390723088861007265581882535850" ..
              "3429057592827629436413108566029093628212635953836686562675849720" ..
              "6207862794310902180176810615217550567108238764764442605581471797" ..
              "07119674283982419152118103759076030616683978566631413"

CIPSOFT_RSA = "1321277432058722840622950990822933849527763264961655079678763618" ..
              "4334395343554449668205332383339435179772895415509701210392836078" ..
              "6959821132214473291575712138800495033169914814069637740318278150" ..
              "2907336840325241747827401343576296990629870233111328210165697754" ..
              "88792221429527047321331896351555606801473202394175817"

PIC_SIGNATURE = 1455807975
OsTypes = {
	Windows = 2,
	OtclientLinux = 10,
	Flash = 3,
	Linux = 1,
	OtclientWindows = 11,
	OtclientMac = 12
}
PathFindResults = {
	NoWay = 4,
	TooFar = 3,
	Impossible = 2,
	Position = 1,
	Ok = 0
}
PathFindFlags = {
	AllowNonWalkable = 8,
	AllowNonPathable = 4,
	AllowCreatures = 2,
	AllowNullTiles = 1
}
VipState = {
	Pending = 2,
	Online = 1,
	Offline = 0
}
ExtendedIds = {
	NeedsUpdate = 7,
	MapShader = 6,
	Particles = 5,
	Sound = 3,
	Ping = 2,
	Locale = 1,
	Activate = 0,
	Forge_Open = 102,
	AutoLoot_Nearest = 105,
	Forge_Request = 104,
	Forge_Close = 103,
	Game = 4,
	AutoLoot = 101,
	Travel = 100
}
PreviewState = {
	Default = 0,
	Active = 2,
	Inactive = 1
}
Blessings = {
	WisdomOfSolitude = 16,
	FireOfSuns = 8,
	EmbraceOfTibia = 4,
	SpiritualShielding = 2,
	Adventurer = 1,
	SparkOfPhoenix = 32,
	None = 0
}
DeathType = {
	Blessed = 1,
	Regular = 0
}
ProductType = {
	Other = 0,
	NameChange = 1
}
StoreErrorType = {
	Information = 4,
	TransferError = 3,
	HistoryError = 2,
	NetworkError = 1,
	PurchaseError = 0,
	NoError = -1
}
StoreState = {
	New = 1,
	Sale = 2,
	Timed = 3,
	None = 0
}
AccountStatus = {
	Frozen = 1,
	Ok = 0,
	Suspended = 2
}
SubscriptionStatus = {
	Premium = 1,
	Free = 0
}
ChannelEvent = {
	Invite = 2,
	Leave = 1,
	Join = 0,
	Exclude = 3
}
RareAdjectives = {
	rare = 2,
	uncommon = 1,
	mythic = 5,
	legendary = 4,
	epic = 3
}
RarityFramesClip = {
	"0 0 34 34",
	"34 0 34 34",
	"68 0 34 34",
	"102 0 34 34",
	"136 0 34 34"
}
RarityWords = {
	[0] = "Common",
	"Uncommon",
	"Rare",
	"Epic",
	"Legendary",
	"Mythic"
}
ItemRarityFrames = {
	[0] = {
		source = "/images/ui/item.png",
		rect = torect("0 0 34 34")
	},
	{
		source = "/images/ui/rarity_items.png",
		rect = torect("0 0 34 34")
	},
	{
		source = "/images/ui/rarity_items.png",
		rect = torect("34 0 34 34")
	},
	{
		source = "/images/ui/rarity_items.png",
		rect = torect("68 0 34 34")
	},
	{
		source = "/images/ui/rarity_items.png",
		rect = torect("102 0 34 34")
	},
	{
		source = "/images/ui/rarity_items.png",
		rect = torect("136 0 34 34")
	}
}
ItemRarityColour = {
	"#2BAF2B",
	"#3A96D8",
	"#B06BCE",
	"#EAA823",
	"#E0311A"
}
