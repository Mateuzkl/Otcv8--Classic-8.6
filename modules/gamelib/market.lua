MarketMaxAmount = 2000
MarketMaxAmountStackable = 64000
MarketMaxPrice = 999999999
MarketMaxOffers = 100
MarketAction = {
	Sell = 1,
	Buy = 0
}
MarketRequest = {
	MyOffers = 65534,
	MyHistory = 65535
}
MarketOfferState = {
	AcceptedEx = 255,
	Accepted = 3,
	Expired = 2,
	Cancelled = 1,
	Active = 0
}
MarketCategory = {
	MetaWeapons = 255,
	Unassigned = 31,
	Gold = 30,
	Unknown4 = 29,
	Unknown3 = 28,
	StashRetrieve = 27,
	Unknown2 = 26,
	Unknown1 = 25,
	CreatureProducs = 24,
	TibiaCoins = 23,
	PremiumScrolls = 22,
	WandsRods = 21,
	Swords = 20,
	DistanceWeapons = 19,
	Clubs = 18,
	Axes = 17,
	Ammunition = 16,
	Valuables = 15,
	Tools = 14,
	Shields = 13,
	Runes = 12,
	Rings = 11,
	Potions = 10,
	Others = 9,
	Legs = 8,
	HelmetsHats = 7,
	Food = 6,
	Decoration = 5,
	Containers = 4,
	Boots = 3,
	Amulets = 2,
	Armors = 1,
	All = 0
}
MarketCategory.First = MarketCategory.Armors
MarketCategory.Last = MarketCategory.Unassigned
MarketCategoryWeapons = {
	[MarketCategory.Ammunition] = {
		slots = {
			255
		}
	},
	[MarketCategory.Axes] = {
		slots = {
			255,
			InventorySlotOther,
			InventorySlotLeft
		}
	},
	[MarketCategory.Clubs] = {
		slots = {
			255,
			InventorySlotOther,
			InventorySlotLeft
		}
	},
	[MarketCategory.DistanceWeapons] = {
		slots = {
			255,
			InventorySlotOther,
			InventorySlotLeft
		}
	},
	[MarketCategory.Swords] = {
		slots = {
			255,
			InventorySlotOther,
			InventorySlotLeft
		}
	},
	[MarketCategory.WandsRods] = {
		slots = {
			255,
			InventorySlotOther,
			InventorySlotLeft
		}
	}
}
MarketCategoryStrings = {
	[0] = "All",
	"Armors",
	"Amulets",
	"Boots",
	"Containers",
	"Decoration",
	"Food",
	"Helmets and Hats",
	"Legs",
	"Others",
	"Potions",
	"Rings",
	"Runes",
	"Shields",
	"Tools",
	"Valuables",
	"Ammunition",
	"Axes",
	"Clubs",
	"Distance Weapons",
	"Swords",
	"Wands and Rods",
	"Premium Scrolls",
	"Tibia Coins",
	"Creature Products",
	"Unknown 1",
	"Unknown 2",
	"Stash Retrieve",
	"Unknown 3",
	"Unknown 4",
	"Gold",
	"Unassigned",
	[255.0] = "Weapons"
}

function getMarketCategoryName(id)
	if table.haskey(MarketCategoryStrings, id) then
		return MarketCategoryStrings[id]
	end
end

function getMarketCategoryId(name)
	local id = table.find(MarketCategoryStrings, name)

	if id then
		return id
	end
end

MarketItemDescription = {
	Imbuements = 16,
	Weight = 15,
	WeaponName = 14,
	Charges = 13,
	Ability = 12,
	Rune = 11,
	Vocation = 10,
	MinMagicLevel = 9,
	MinLevel = 8,
	Combat = 7,
	DecayTime = 6,
	General = 5,
	Defense = 4,
	Container = 3,
	Attack = 2,
	Armor = 1
}
MarketItemDescription.First = MarketItemDescription.Armor
MarketItemDescription.Last = MarketItemDescription.Weight
MarketItemDescriptionStrings = {
	"Armor",
	"Attack",
	"Container",
	"Defense",
	"Description",
	"Use Time",
	"Combat",
	"Min Level",
	"Min Magic Level",
	"Vocation",
	"Rune",
	"Ability",
	"Charges",
	"Weapon Type",
	"Weight",
	"Imbuements"
}

function getMarketDescriptionName(id)
	if table.haskey(MarketItemDescriptionStrings, id) then
		return MarketItemDescriptionStrings[id]
	end
end

function getMarketDescriptionId(name)
	local id = table.find(MarketItemDescriptionStrings, name)

	if id then
		return id
	end
end

MarketSlotFilters = {
	[255.0] = "Any",
	[InventorySlotOther] = "Two-Handed",
	[InventorySlotLeft] = "One-Handed"
}
MarketFilters = {
	Depot = 3,
	Level = 2,
	Vocation = 1,
	SearchAll = 4
}
MarketFilters.First = MarketFilters.Vocation
MarketFilters.Last = MarketFilters.Depot

function getMarketSlotFilterId(name)
	local id = table.find(MarketSlotFilters, name)

	if id then
		return id
	end
end

function getMarketSlotFilterName(id)
	if table.haskey(MarketSlotFilters, id) then
		return MarketSlotFilters[id]
	end
end
