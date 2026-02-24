UICreatureButton = extends(UIWidget, "UICreatureButton")
local CreatureButtonColors = {
	onIdle = {
		notHovered = "#888888",
		hovered = "#FFFFFF"
	},
	onTargeted = {
		notHovered = "#FF0000",
		hovered = "#FF8888"
	},
	onFollowed = {
		notHovered = "#00FF00",
		hovered = "#88FF88"
	}
}
local LifeBarColors = {}

table.insert(LifeBarColors, {
	color = "#00BC00",
	percentAbove = 92
})
table.insert(LifeBarColors, {
	color = "#50A150",
	percentAbove = 60
})
table.insert(LifeBarColors, {
	color = "#A1A100",
	percentAbove = 30
})
table.insert(LifeBarColors, {
	color = "#BF0A0A",
	percentAbove = 8
})
table.insert(LifeBarColors, {
	color = "#910F0F",
	percentAbove = 3
})
table.insert(LifeBarColors, {
	color = "#850C0C",
	percentAbove = -1
})

function UICreatureButton.create()
	local button = UICreatureButton.internalCreate()

	button:setFocusable(false)

	button.creature = nil
	button.isHovered = false

	return button
end

function UICreatureButton:setCreature(creature)
	self.creature = creature
end

function UICreatureButton:getCreature()
	return self.creature
end

function UICreatureButton:getCreatureId()
	return self.creature:getId()
end

function UICreatureButton:setup(id)
	self.lifeBarWidget = self:getChildById("lifeBar")
	self.creatureWidget = self:getChildById("creature")
	self.labelWidget = self:getChildById("label")
	self.skullWidget = self:getChildById("skull")
	self.emblemWidget = self:getChildById("emblem")
end

function UICreatureButton:update()
	local color = CreatureButtonColors.onIdle
	local show = false

	if self.creature == g_game.getAttackingCreature() then
		color = CreatureButtonColors.onTargeted
	elseif self.creature == g_game.getFollowingCreature() then
		color = CreatureButtonColors.onFollowed
	end

	color = self.isHovered and color.hovered or color.notHovered

	if self.color == color then
		return
	end

	self.color = color

	if color ~= CreatureButtonColors.onIdle.notHovered then
		self.creatureWidget:setBorderWidth(1)
		self.creatureWidget:setBorderColor(color)
		self.labelWidget:setColor(color)
	else
		self.creatureWidget:setBorderWidth(0)
		self.labelWidget:setColor(color)
	end
end

function UICreatureButton:creatureSetup(creature)
	if self.creature ~= creature then
		self.creature = creature

		self.creatureWidget:setCreature(creature)

		if self.creatureName ~= creature:getName() then
			self.creatureName = creature:getName()

			self.labelWidget:setText(creature:getName())
		end
	end

	self:updateLifeBarPercent()
	self:updateSkull()
	self:updateEmblem()
	self:update()
end

function UICreatureButton:updateSkull()
	if not self.creature then
		return
	end

	local skullId = self.creature:getSkull()

	if skullId == self.skullId then
		return
	end

	self.skullId = skullId

	if skullId ~= SkullNone then
		self.skullWidget:setWidth(self.skullWidget:getHeight())

		local imagePath = getSkullImagePath(skullId)

		self.skullWidget:setImageSource(imagePath)
		self.labelWidget:setMarginLeft(5)
	else
		self.skullWidget:setWidth(0)

		if self.creature:getEmblem() == EmblemNone then
			self.labelWidget:setMarginLeft(2)
		end
	end
end

function UICreatureButton:updateEmblem()
	if not self.creature then
		return
	end

	local emblemId = self.creature:getEmblem()

	if self.emblemId == emblemId then
		return
	end

	self.emblemId = emblemId

	if emblemId ~= EmblemNone then
		self.emblemWidget:setWidth(self.emblemWidget:getHeight())

		local imagePath = getEmblemImagePath(emblemId)

		self.emblemWidget:setImageSource(imagePath)
		self.emblemWidget:setMarginLeft(5)
		self.labelWidget:setMarginLeft(5)
	else
		self.emblemWidget:setWidth(0)
		self.emblemWidget:setMarginLeft(0)

		if self.creature:getSkull() == SkullNone then
			self.labelWidget:setMarginLeft(2)
		end
	end
end

function UICreatureButton:updateLifeBarPercent()
	if not self.creature then
		return
	end

	local percent = self.creature:getHealthPercent()

	if self.percent == percent then
		return
	end

	self.percent = percent

	self.lifeBarWidget:setPercent(percent)

	local color = nil

	for i, v in pairs(LifeBarColors) do
		if v.percentAbove < percent then
			color = v.color

			break
		end
	end

	self.lifeBarWidget:setBackgroundColor(color)
end
