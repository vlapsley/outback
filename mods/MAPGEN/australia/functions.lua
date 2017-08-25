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


function displaytime(time)
	return math.floor(time * 1000000 + 0.5) / 1000 .. " ms"
end
