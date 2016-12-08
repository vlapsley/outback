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


--[[
	Convert dirt with dry grass to dirt with dry graan grass when next to dirt with grass.
--]]

minetest.register_abm({
	nodenames = {"default:dirt_with_grass"},
	neighbors = {
		"default:dirt_with_dry_grass",
	},
	interval = 6,
	chance = 67,
	catch_up = false,
	action = function(pos, node)
		-- Most likely case, half the time it's too dark for this.
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for likely neighbors.
		local p2 = minetest.find_node_near(pos, 1, {"default:dirt_with_dry_grass"})
		if p2 then
			-- But the node needs to be under air in this case.
			local n2 = minetest.get_node(above)
			if n2 and n2.name == "air" then
				minetest.set_node(pos, {name = "australia:dirt_with_dry_green_grass"})
				return
			end
		end

		-- Anything on top?
		local n2 = minetest.get_node(above)
		if not n2 then
			return
		end

		local name = n2.name
		-- Snow check is cheapest, so comes first.
		if name == "default:snow" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		-- Most likely case first.
		elseif minetest.get_item_group(name, "grass") ~= 0 then
			minetest.set_node(pos, {name = "default:dirt_with_grass"})
		elseif minetest.get_item_group(name, "dry_grass") ~= 0 then
			minetest.set_node(pos, {name = "default:dirt_with_dry_grass"})
		end

	end
})
