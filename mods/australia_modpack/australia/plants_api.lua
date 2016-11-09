aus.registered_plants = {}

-- localize math routines for performance
local math_floor = math.floor
local math_random = math.random

function aus.register_plant(params)
	local n = #aus.registered_plants + 1
	params.priority = math_floor(params.priority) + 1 / n

	aus.registered_plants[n] = params
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
	table.sort(aus.registered_plants,
		function(a, b)
			return a.priority > b.priority
		end
	)

	for _, plant in ipairs(aus.registered_plants) do -- convert 'nodes' into content IDs
		plant.nodes = get_content_id(plant.nodes)
	end
end)

function aus.choose_generate_plant(conditions, pos, data, area, ivm)
	local rand = math_random() -- Random number to choose the plant
	for _, plant in ipairs(aus.registered_plants) do -- for each registered plant
		local cover = plant.cover
		if plant.check(conditions, pos) then -- Place this plant, or do not place anything (see Cover parameter)
			if rand < cover then
				if rand < plant.density then
					local grow = plant.grow
					local nodes = plant.nodes

					if grow then -- if a grow function is defined, then run it
						grow(nodes, pos, data, area, ivm, conditions)
					else
						if type(nodes) == "number" then -- 'nodes' is just a number
							data[ivm] = nodes
						else -- 'nodes' is an array
							local node = nodes[math_random(#nodes)]
							local n = nodes.n or 1
							local ystride = area.ystride

							for h = 1, n do
								data[ivm] = node
								ivm = ivm + ystride
							end
						end
					end
				end
				break
			else
				rand = (rand - cover) / (1 - cover)
			end
		end
	end
end
