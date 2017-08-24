-- mods/australia_modpack/australia/functions.lua


aus.registered_on_first_mapgen = {}

function aus.register_on_first_mapgen(func) -- Callback
	table.insert(aus.registered_on_first_mapgen, func)
end

local function get_content_id(value) -- get content ID recursively from a table.
	local typeval = type(value)

	if typeval == "string" then
		return minetest.get_content_id(value)
	elseif typeval == "table" then
		for k, v in pairs(value) do
			value[k] = get_content_id(v)
		end
	end

	return value
end

aus.register_on_first_mapgen(function()
	table.sort(plants_api.registered_plants,
		function(a, b)
			return a.priority > b.priority
		end
	)

	for _, plant in ipairs(plants_api.registered_plants) do  -- convert 'nodes' into content IDs
		plant.nodes = get_content_id(plant.nodes)
	end
end)


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
