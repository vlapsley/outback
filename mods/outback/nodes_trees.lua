--[[
	Tree nodes
--]]


outback.schematics = {}

-- Grey Mangrove
minetest.register_node("outback:grey_mangrove_tree", {
	description = "Grey Mangrove Tree",
	tiles = {
		"ob_grey_mangrove_tree_top.png",
		"ob_grey_mangrove_tree_top.png",
		"ob_grey_mangrove_tree.png"
	},
	paramtype2 = "facedir",
	paramtype = "light",
	drawtype = "nodebox",
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, 8/16, 3/32},
	},
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, 8/16, 3/32},
	},
	drop = 'default:stick 4',
	groups = {tree = 1, choppy = 3, flammable = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("outback:grey_mangrove_leaves", {
	description = "Grey Mangrove Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"ob_grey_mangrove_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"outback:grey_mangrove_sapling"}, rarity = 20,},
			{items = {"outback:grey_mangrove_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("outback:grey_mangrove_sapling", {
	description = "Grey Mangrove Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ob_mangrove_sapling.png"},
	inventory_image = "ob_mangrove_sapling.png",
	wield_image = "ob_mangrove_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"outback:grey_mangrove_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 5, z = 2},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})


-- Create and initialize a table for a schematic.
function outback.schematic_array(width, height, depth)
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

-- Make a tree trunk 2-nodes wide.
local function make_treetrunk2(x0, y0, z0, data, area, height, trunk, air, base)
	local ystride = area.ystride
	local ybot = y0 - 1
	for x = x0, x0 + 1 do
		for y = 1,height do
			for z = z0, z0 + 1 do -- iterate in a 2x2 square around the trunk
				local iv = area:index(x, ybot, z)
				for i = 0, height + 1 do
					if data[iv] == air then -- find the ground level
						if math.random() < base then
							data[iv-ystride] = trunk -- make tree trunk below
							if math.random() < base then
								data[iv] = trunk -- make tree trunk at this air node
							end
						end
						break
					end
					iv = iv + ystride -- increment by one node up
				end
			end
		end
	end
end

-- Make a tree trunk 3-nodes wide.
local function make_treetrunk3(x0, y0, z0, data, area, height, trunk, air, base)
	local ystride = area.ystride
	local ybot = y0 - 1
	for x = x0 - 1, x0 + 1 do
		for y = 1, height do
			for z = z0 - 1, z0 + 1 do -- iterate in a 3x3 square around the trunk
				local iv = area:index(x, ybot, z)
				for i = 0, height + 1 do
					if data[iv] == air then -- find the ground level
						if math.random() < base then
							data[iv-ystride] = trunk -- make tree trunk below
							if math.random() < base then
								data[iv] = trunk -- make tree trunk at this air node
							end
						end
						break
					end
					iv = iv + ystride -- increment by one node up
				end
			end
		end
	end
end


-- Make leaves on a tree in a noise blob.
function outback.make_leavesblob(pos, data, area, trunk, leaves, air, ignore, radius, np, limbs, fruit_chance, fruit)
	limbs = limbs
	fruit_chance = fruit_chance or 0
	np.seed = math.random(0, 16777215) -- noise seed
	local minp = vector.subtract(pos, radius) -- minimal corner of the leavesblob
	local maxp = vector.add(pos, radius) -- maximal corner of the leavesblob
	 -- Same positions, but with integer coordinates
	local int_minp = {x = math.floor(minp.x), y = math.floor(minp.y), z = math.floor(minp.z)}
	local int_maxp = {x = math.ceil(maxp.x), y = math.ceil(maxp.y), z = math.ceil(maxp.z)}

	local length = vector.subtract(int_maxp, int_minp)
	local chulens = vector.add(length, 1)
	local obj = minetest.get_perlin_map(np, chulens)
	local pmap = obj:get3dMap_flat(minp)
	local i = 1
	-- iterate for every position
	-- calculate the distance from the center by the Pythagorean theorem: d = sqrt(x²+y²+z²)
	for x = int_minp.x, int_maxp.x do
		-- calculate x², y², z² separately, to avoid recalculating x² for every
		-- y or z iteration. Divided by the radius to scale it to 0…1
		local xval = ((x - pos.x) / radius.x) ^ 2
		for y = int_minp.y, int_maxp.y do
			local yval = ((y - pos.y) / radius.y) ^ 2
			for z = int_minp.z, int_maxp.z do
				local zval = ((z - pos.z) / radius.z) ^ 2
				local dist = math.sqrt(xval + yval + zval) -- Calculate the distance
				local nval = pmap[i] -- Get the noise value
				if nval > dist then -- if the noise is bigger than the distance, make leaves
					local iv = area:index(x, y, z)
					if data[iv] == air or data[iv] == ignore then
						 -- make some branches within the leaf structure
						if nval > dist * 1.5 and limbs and math.random(5) == 1 then
							data[iv] = trunk
						-- if a fruit tree add fruit
						elseif math.random() < fruit_chance then
							data[iv] = fruit
						else
							data[iv] = leaves
						end
					end
				end
				i = i + 1 -- increment noise index
			end
		end
	end
end

-- Generic bush function.
function outback.make_bush(pos, data, area, height, radius, stem, leaves, air,
		ignore)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = stem
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	outback.make_leavesblob(pos, data, area, stem, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np)
end

-- Generic tree function.
function outback.make_tree(pos, data, area, height, radius, trunk, leaves, air,
		ignore, limbs, fruit_chance, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	outback.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs, fruit_chance, fruit)
end

function outback.make_mangrove(pos, data, area, height, radius, trunk, leaves, air, ignore)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	outback.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np)
	for z_dist = -1, 1 do
		local vi_1 = area:index(x - 1, y - 1, z + z_dist)
		local vi_2 = area:index(x - 1, y, z + z_dist)
		local vi_3 = area:index(x - 1, y + 1, z + z_dist)
		for x_dist = -1, 1 do
			if math.random(1, 3) >= 2 then
				if data[vi_1] == air or data[vi_1] == ignore then
					data[vi_1] = trunk
				elseif data[vi_2] == air or data[vi_2] == ignore then
					data[vi_2] = trunk
				elseif data[vi_3] == air or data[vi_3] == ignore then
					data[vi_3] = trunk
				end
			end
			vi_1 = vi_1 + 1
			vi_2 = vi_2 + 1
		end
	end
end

-- Mangrove trees use schematic placement because the vocelmanipulator cannot place nodes under sea level.
function outback.generate_mangrove_tree_schematic(trunk_height, trunk, leaf)
	local height = trunk_height * 2 + 1
	local radius = 2
	local width = 2 * radius + 1
	local trunk_top = height - 3
	local s = outback.schematic_array(width, height, width)

	-- roots, trunk, and extra leaves
	for z = -1, 1 do
		for y = 1, trunk_top do
			for x = -1, 1 do
				local i = (z + radius) * width * height + y * width + (x + radius) + 1
				if x == 0 and z == 0 then
					s.data[i].name = trunk
					s.data[i].param1 = 255
					s.data[i].force_place = true
				elseif (x == 0 or z == 0) and y < 3 then
					s.data[i].name = trunk
					s.data[i].param1 = 255
					s.data[i].force_place = true
				elseif y > 3 then
					s.data[i].name = leaf
					s.data[i].param1 = 50
				end
			end
		end
	end

	-- canopy
	for y = 1, trunk_top + 2 do
		if y > trunk_height and (y == trunk_top or math.random(1, height - y) == 1) then
			local x, z = 0, 0
			while x == 0 and z == 0 do
				x = math.random(-1, 1) * 2
				z = math.random(-1, 1) * 2
			end
			for j = -1, 1, 2 do
				outback.generate_canopy(s, leaf, {x = j * x, y = y, z = j * z})
			end
		end
	end
	return s
end

-- Create a canopy of leaves.
function outback.generate_canopy(s, leaf, pos)
	local height = s.size.y
	local width = s.size.x
	local rx = math.floor(s.size.x / 2)
	local rz = math.floor(s.size.z / 2)
	local r1 = 4  -- leaf decay radius
	local probs = {255, 200, 150, 100, 75}

	for z = -r1, r1 do
		for y = 0, 1 do
			for x = -r1, r1 do
				if x+pos.x >= -rx and x + pos.x <= rx and y + pos.y >= 0 and
						y + pos.y < height and z + pos.z >= -rz and z + pos.z <= rz then
					local i = (z + pos.z + rz) * width * height + (y + pos.y) * width + (x + pos.x + rx) + 1
					local dist1 = math.sqrt(x^2 + y^2 + z^2)
					local dist2 = math.sqrt((x+pos.x)^2 + (z+pos.z)^2)
					if dist1 <= r1 then
						local newprob = probs[math.max(1, math.ceil(dist1))]
						if s.data[i].name == "air" then
							s.data[i].name = leaf
							s.data[i].param1 = newprob
						elseif s.data[i].name == leaf then
							s.data[i].param1 = math.max(s.data[i].param1, newprob)
						end
					end
				end
			end
		end
	end
end

function outback.grow_grey_mangrove(pos)
	-- individual parameters
	local height = math.random(3, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("outback:grey_mangrove_tree")
	local leaves = minetest.get_content_id("outback:grey_mangrove_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 1, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	outback.make_mangrove(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Palm Tree
minetest.register_node("outback:palm_tree", {
	description = "Palm Tree",
	tiles = {
		"ob_palm_tree_top.png",
		"ob_palm_tree_top.png",
		"ob_palm_tree.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("outback:palm_leaves", {
	description = "Palm Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"ob_palm_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 5, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"outback:palm_sapling"}, rarity = 20,},
			{items = {"outback:palm_leaves"},}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = default.after_place_leaves,
})

minetest.register_node("outback:palm_sapling", {
	description = "Palm Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"ob_palm_sapling.png"},
	inventory_image = "ob_palm_sapling.png",
	wield_image = "ob_palm_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -5/16, 5/16, 11/32, 5/16}
	},
	groups = {snappy = 2, dig_immediate = 2, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(2400,4800))
	end,
	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"outback:palm_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -5, y = 1, z = -5},
			{x = 5, y = 15, z = 5},
			-- maximum interval of interior volume check
			4)
		return itemstack
	end,
})

outback.palm_model={
	axiom="FFcccccc&FFFFFdddRA//A//A//A//A//A",
	rules_a="[&fb&bbb[++f--&ffff&ff][--f++&ffff&ff]&ffff&bbbb&b]",
	rules_b="f",
	rules_c="/",
	rules_d="F",
	trunk="outback:palm_tree",
	leaves="outback:palm_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="outback:palm_tree",
	fruit_chance=0
}
