-- mods/australia_modpack/australia/functions.lua

-- Create and initialize a table for a schematic.
function aus.schematic_array(width, height, depth)
	-- Dimensions of data array.
	local s = {size = {x = width, y = height, z = depth}}
	s.data = {}

	for z = 0, depth - 1 do
		for y = 0, height - 1 do
			for x = 0, width - 1 do
				local i = z * width * height + y * width + x + 1
				s.data[i] = {}
				s.data[i].name = "air"
				s.data[i].param1 = 000
			end
		end
	end

	s.yslice_prob = {}

	return s
end

-- Push an element onto a stack (table).
function push(t, x)
	t[#t+1] = x
end

-- Check if the table contains an element.
function table.contains(table, element)
	for key, value in pairs(table) do
		if value == element then
			if key then
				return key
			else
				return true
			end
		end
	end

	return false
end

-- Round a number to the given decimal places
function math.round(num, idp)
	local mult = 10 ^ (idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function displaytime(time)
	return math.floor(time * 1000000 + 0.5) / 1000 .. " ms"
end
