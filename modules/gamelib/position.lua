Position = {
	equals = function (pos1, pos2)
		return pos1.x == pos2.x and pos1.y == pos2.y and pos1.z == pos2.z
	end,
	greaterThan = function (pos1, pos2, orEqualTo)
		if orEqualTo then
			return pos2.x <= pos1.x or pos2.y <= pos1.y or pos2.z <= pos1.z
		else
			return pos2.x < pos1.x or pos2.y < pos1.y or pos2.z < pos1.z
		end
	end,
	lessThan = function (pos1, pos2, orEqualTo)
		if orEqualTo then
			return pos1.x <= pos2.x or pos1.y <= pos2.y or pos1.z <= pos2.z
		else
			return pos1.x < pos2.x or pos1.y < pos2.y or pos1.z < pos2.z
		end
	end,
	isInRange = function (pos1, pos2, xRange, yRange)
		return math.abs(pos1.x - pos2.x) <= xRange and math.abs(pos1.y - pos2.y) <= yRange and pos1.z == pos2.z
	end,
	isValid = function (pos)
		return pos.x ~= 65535 or pos.y ~= 65535 or pos.z ~= 255
	end,
	distance = function (pos1, pos2)
		return math.sqrt(math.pow(pos2.x - pos1.x, 2) + math.pow(pos2.y - pos1.y, 2))
	end,
	manhattanDistance = function (pos1, pos2)
		return math.abs(pos2.x - pos1.x) + math.abs(pos2.y - pos1.y)
	end
}
