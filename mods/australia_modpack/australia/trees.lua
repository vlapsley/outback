-- mods/australia_modpack/australia/trees.lua

-- Localize math routines for performance.
local math_abs = math.abs
local math_ceil = math.ceil
local math_floor = math.floor
local math_max = math.max
local math_random = math.random
local math_sqrt = math.sqrt

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
						if math_random() < base then
							data[iv-ystride] = trunk -- make tree trunk below
							if math_random() < base then
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
						if math_random() < base then
							data[iv-ystride] = trunk -- make tree trunk below
							if math_random() < base then
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

-- Generic tree function.
function aus.make_tree(pos, data, area, height, radius, trunk, leaves, air,
		ignore, limbs, fruit_chance, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs, fruit_chance, fruit)
end

function aus.make_black_box(pos, data, area, height, radius, trunk, leaves,
		air, ignore, limbs, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.5)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.8, z = radius}, np, limbs)
end

function aus.make_black_wattle(pos, data, area, height, radius, trunk, leaves,
		air, ignore, limbs, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 1.5, z = radius}, np, limbs)
end

function aus.make_tall_gum(pos, data, area, height, radius, trunk, leaves, air,
		ignore, limbs, fruit)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.2)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 1.25, z = radius}, np, limbs)
end

function aus.make_boab(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	local ystride = area.ystride -- Useful to get the index above
	local base = 0.8
	local ybot = pos.y - 1
	for x = pos.x - 1, pos.x + 1 do
		for y = 1, height do
			for z = pos.z - 1, pos.z + 1 do -- iterate in a 3x3 square around the trunk
				local iv = area:index(x, ybot, z)
				for i = 0, height + 1 do
					if data[iv] == air then -- find the ground level
						if math_random() < base then
							data[iv-ystride] = trunk -- make tree trunk below
							if math_random() < base then
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
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height - 1
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np, limbs)
end

function aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air,
		ignore, limbs, fruit_chance, fruit)
	local x, y, z = pos.x, pos.y, pos.z
	fruit_chance = fruit_chance or 0
	-- Trunk
	for y_dist = 0, height - 1 do
		local iv = area:index(x, y + y_dist, z)
		if y_dist == 0 or data[iv] == air or data[iv] == leaves then
			data[iv] = trunk
		end
	end
	-- Add rings of leaves randomly
	local d = 0
	for yi = height + 1, 2 + math_random(0, 1), -1 do
		for xi = -d, d do
			for zi = -d, d do
				if math_abs(xi) + math_abs(zi) <= d or math_abs(zi) + math_abs(xi) <= d then
					local iv = area:index(x + xi, y + yi, z + zi)
					if data[iv] == air or data[iv] == ignore then
						if math_random() < fruit_chance then
							data[iv] = fruit
						else
							data[iv] = leaves
						end
					end
				end
			end
		end
	d = d + 1
	if d > math_random(2,4) then d = 1 end
	end
end

function aus.make_fan_palm(pos, data, area, height, radius, trunk, leaves, air, ignore)
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np)
end

function aus.make_jarrah(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.8)
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.4)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

function aus.make_karri(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.8)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

function aus.make_mangrove(pos, data, area, height, radius, trunk, leaves, air, ignore)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np)
	for z_dist = -1, 1 do
		local vi_1 = area:index(x - 1, y - 1, z + z_dist)
		local vi_2 = area:index(x - 1, y, z + z_dist)
		local vi_3 = area:index(x - 1, y + 1, z + z_dist)
		for x_dist = -1, 1 do
			if math_random(1, 3) >= 2 then
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
function aus.generate_mangrove_tree_schematic(trunk_height, trunk, leaf)
	local height = trunk_height * 2 + 1
	local radius = 2
	local width = 2 * radius + 1
	local trunk_top = height - 3
	local s = aus.schematic_array(width, height, width)

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
		if y > trunk_height and (y == trunk_top or math_random(1, height - y) == 1) then
			local x, z = 0, 0
			while x == 0 and z == 0 do
				x = math_random(-1, 1) * 2
				z = math_random(-1, 1) * 2
			end
			for j = -1, 1, 2 do
				aus.generate_canopy(s, leaf, {x = j * x, y = y, z = j * z})
			end
		end
	end
	return s
end

-- Create a canopy of leaves.
function aus.generate_canopy(s, leaf, pos)
	local height = s.size.y
	local width = s.size.x
	local rx = math_floor(s.size.x / 2)
	local rz = math_floor(s.size.z / 2)
	local r1 = 4  -- leaf decay radius
	local probs = {255, 200, 150, 100, 75}

	for z = -r1, r1 do
		for y = 0, 1 do
			for x = -r1, r1 do
				if x+pos.x >= -rx and x + pos.x <= rx and y + pos.y >= 0 and
						y + pos.y < height and z + pos.z >= -rz and z + pos.z <= rz then
					local i = (z + pos.z + rz) * width * height + (y + pos.y) * width + (x + pos.x + rx) + 1
					local dist1 = math_sqrt(x^2 + y^2 + z^2)
					local dist2 = math_sqrt((x+pos.x)^2 + (z+pos.z)^2)
					if dist1 <= r1 then
						local newprob = probs[math_max(1, math_ceil(dist1))]
						if s.data[i].name == "air" then
							s.data[i].name = leaf
							s.data[i].param1 = newprob
						elseif s.data[i].name == leaf then
							s.data[i].param1 = math_max(s.data[i].param1, newprob)
						end
					end
				end
			end
		end
	end
end

function aus.make_marri(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.6)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

function aus.make_merbau(pos, data, area, height, radius, trunk, leaves, air, ignore)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.2)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius * 0.5, z = radius}, np)
end

function aus.make_moreton_bay_fig(pos, data, area, height, radius, trunk,
		leaves, air, ignore, limbs, fruit_chance, fruit)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.7)
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.3)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs, fruit_chance, fruit)
end

function aus.make_river_red_gum(pos, data, area, height, radius, trunk, leaves,
		air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.7)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

function aus.make_swamp_gum(pos, data, area, height, radius, trunk, leaves,
		air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.8)
	make_treetrunk3(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.5)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8},
			octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius * 0.8, y = radius * 1.2, z = radius * 0.8}, np, limbs)
end

function aus.make_tasmanian_myrtle(pos, data, area, height, radius, trunk,
		leaves, air, ignore, limbs)
	local x, y, z = pos.x, pos.y, pos.z
	local ystride = area.ystride -- Useful to get the index above
	local iv = area:indexp(pos)
	for i = 1, height do -- Build the trunk
		data[iv] = trunk
		iv = iv + ystride -- increment by one node up
	end
	make_treetrunk2(pos.x, pos.y, pos.z, data, area, height, trunk, air, 0.6)
	local np = {offset = 0.8, scale = 0.4, spread = {x = 8, y = 4, z = 8}, octaves = 3, persist = 0.5}
	pos.y = pos.y + height
	aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore,
			{x = radius, y = radius, z = radius}, np, limbs)
end

-- Make leaves on a tree in a noise blob.
function aus.make_leavesblob(pos, data, area, trunk, leaves, air, ignore, radius, np, limbs, fruit_chance, fruit)
	limbs = limbs
	fruit_chance = fruit_chance or 0
	np.seed = math_random(0, 16777215) -- noise seed
	local minp = vector.subtract(pos, radius) -- minimal corner of the leavesblob
	local maxp = vector.add(pos, radius) -- maximal corner of the leavesblob
	 -- Same positions, but with integer coordinates
	local int_minp = {x = math_floor(minp.x), y = math_floor(minp.y), z = math_floor(minp.z)}
	local int_maxp = {x = math_ceil(maxp.x), y = math_ceil(maxp.y), z = math_ceil(maxp.z)}

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
				local dist = math_sqrt(xval + yval + zval) -- Calculate the distance
				local nval = pmap[i] -- Get the noise value
				if nval > dist then -- if the noise is bigger than the distance, make leaves
					local iv = area:index(x, y, z)
					if data[iv] == air or data[iv] == ignore then
						 -- make some branches within the leaf structure
						if nval > dist * 1.5 and limbs and math_random(5) == 1 then
							data[iv] = trunk
						-- if a fruit tree add fruit
						elseif math_random() < fruit_chance then
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


-- Arnhem Cypress Pine
function aus.grow_arnhem_cypress_pine(pos)
	-- individual parameters
	local height = math_random(10, 15)
	local radius = 4
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:arnhem_cypress_pine_tree")
	local leaves = minetest.get_content_id("australia:arnhem_cypress_pine_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 2, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Black Box
function aus.grow_black_box(pos)
	-- individual parameters
	local height = math_random(5, 10)
	local radius = math_random(4, 6)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:black_box_tree")
	local leaves = minetest.get_content_id("australia:black_box_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 6, y = pos.y, z = pos.z - 6},
		{x = pos.x + 6, y = pos.y + height + 6, z = pos.z + 6}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_black_box(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Black Wattle
function aus.grow_black_wattle(pos)
	-- individual parameters
	local height = math_random(6, 8)
	local radius = 3
	local limbs = false
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:black_wattle_tree")
	local leaves = minetest.get_content_id("australia:black_wattle_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_black_wattle(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Blue Gum
function aus.grow_blue_gum(pos)
	-- individual parameters
	local height = math_random(12, 22)
	local radius = math_random(5, 7)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:blue_gum_tree")
	local leaves = minetest.get_content_id("australia:blue_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 7, y = pos.y, z = pos.z - 7},
		{x = pos.x + 7, y = pos.y + height + 9, z = pos.z + 7}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tall_gum(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Boab
function aus.grow_boab(pos)
	-- individual parameters
	local height = math_random(5, 6)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:boab_tree")
	local leaves = minetest.get_content_id("australia:boab_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 3, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_boab(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Bull Banksia
function aus.grow_bull_banksia(pos)
	-- individual parameters
	local height = math_random(3, 5)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:bull_banksia_tree")
	local leaves = minetest.get_content_id("australia:bull_banksia_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Celery-top Pine
function aus.grow_celery_top_pine(pos)
	-- individual parameters
	local height = math_random(8, 10)
	local radius = math_random(3, 4)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:celery_top_pine_tree")
	local leaves = minetest.get_content_id("australia:celery_top_pine_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 2, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Cherry
function aus.grow_cherry(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 3
	local limbs = nil
	local fruit_chance = 0.2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:cherry_tree")
	local leaves = minetest.get_content_id("australia:cherry_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:cherry")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 2, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Coast Banksia
function aus.grow_coast_banksia(pos)
	-- individual parameters
	local height = math_random(8, 13)
	local radius = math_random(5, 6)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:coast_banksia_tree")
	local leaves = minetest.get_content_id("australia:coast_banksia_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Coolabah
function aus.grow_coolabah(pos)
	-- individual parameters
	local height = math_random(7, 10)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:coolabah_tree")
	local leaves = minetest.get_content_id("australia:coolabah_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Daintree Stringybark
function aus.grow_daintree_stringybark(pos)
	-- individual parameters
	local height = math_random(15, 20)
	local radius = math_random(7, 9)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:daintree_stringybark_tree")
	local leaves = minetest.get_content_id("australia:daintree_stringybark_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 9, y = pos.y, z = pos.z - 9},
		{x = pos.x + 9, y = pos.y + height + 11, z = pos.z + 9}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tall_gum(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Darwin Woollybutt
function aus.grow_darwin_woollybutt(pos)
	-- individual parameters
	local height = math_random(8, 13)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:darwin_woollybutt_tree")
	local leaves = minetest.get_content_id("australia:darwin_woollybutt_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Desert Oak
function aus.grow_desert_oak(pos)
	-- individual parameters
	local height = math_random(4, 8)
	local radius = math_random(2, 4)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:desert_oak_tree")
	local leaves = minetest.get_content_id("australia:desert_oak_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Fan Palm
function aus.grow_fan_palm(pos)
	-- individual parameters
	local height = math_random(6, 8)
	local radius = 3
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:fan_palm_tree")
	local leaves = minetest.get_content_id("australia:fan_palm_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y - 1, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 2, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_fan_palm(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Flame Grevillea
function aus.grow_flame_grevillea(pos)
	-- individual parameters
	local height = math_random(2, 3)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:flame_grevillea_tree")
	local leaves = minetest.get_content_id("australia:flame_grevillea_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Golden Wattle
function aus.grow_golden_wattle(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:golden_wattle_tree")
	local leaves = minetest.get_content_id("australia:golden_wattle_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Grey Mangrove
function aus.grow_grey_mangrove(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:grey_mangrove_tree")
	local leaves = minetest.get_content_id("australia:grey_mangrove_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 1, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_mangrove(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Huon Pine
function aus.grow_huon_pine(pos)
	-- individual parameters
	local height = math_random(8, 13)
	local radius = math_random(5, 6)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:huon_pine_tree")
	local leaves = minetest.get_content_id("australia:huon_pine_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 6, y = pos.y, z = pos.z - 6},
		{x = pos.x + 6, y = pos.y + height + 6, z = pos.z + 6}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Illawarra Flame Tree
function aus.grow_illawarra_flame(pos)
	-- individual parameters
	local height = math_random(9, 11)
	local radius = math_random(6, 7)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:illawarra_flame_tree")
	local leaves = minetest.get_content_id("australia:illawarra_flame_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 7, y = pos.y, z = pos.z - 7},
		{x = pos.x + 7, y = pos.y + height + 7, z = pos.z + 7}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Jarrah
function aus.grow_jarrah(pos)
	-- individual parameters
	local height = math_random(15, 20)
	local radius = math_random(8, 10)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:jarrah_tree")
	local leaves = minetest.get_content_id("australia:jarrah_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 10, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_jarrah(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Karri
function aus.grow_karri(pos)
	-- individual parameters
	local height = math_random(20, 30)
	local radius = math_random(8, 10)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:karri_tree")
	local leaves = minetest.get_content_id("australia:karri_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 10, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_karri(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Lemon Eucalyptus
function aus.grow_lemon_eucalyptus(pos)
	-- individual parameters
	local height = math_random(12, 18)
	local radius = math_random(5, 6)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:lemon_eucalyptus_tree")
	local leaves = minetest.get_content_id("australia:lemon_eucalyptus_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 6, y = pos.y, z = pos.z - 6},
		{x = pos.x + 6, y = pos.y + height + 6, z = pos.z + 6}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Lemon Myrtle
function aus.grow_lemon_myrtle(pos)
	-- individual parameters
	local height = math_random(3, 5)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:lemon_myrtle_tree")
	local leaves = minetest.get_content_id("australia:lemon_myrtle_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Lilly Pilly
function aus.grow_lilly_pilly(pos)
	-- individual parameters
	local height = math_random(4, 6)
	local radius = math_random(4, 6)
	local limbs = nil
	local fruit_chance = 0.3
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:lilly_pilly_tree")
	local leaves = minetest.get_content_id("australia:lilly_pilly_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:lilly_pilly_berries")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 6, y = pos.y, z = pos.z - 6},
		{x = pos.x + 6, y = pos.y + height + 6, z = pos.z + 6}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Macadamia
function aus.grow_macadamia(pos)
	-- individual parameters
	local height = math_random(6, 8)
	local radius = math_random(3, 4)
	local limbs = nil
	local fruit_chance = 0.3
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:macadamia_tree")
	local leaves = minetest.get_content_id("australia:macadamia_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:macadamia")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Mangrove Apple
function aus.grow_mangrove_apple(pos)
	-- individual parameters
	local height = math_random(6, 8)
	local radius = math_random(3, 4)
	local limbs = nil
	local fruit_chance = 0.2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:mangrove_apple_tree")
	local leaves = minetest.get_content_id("australia:mangrove_apple_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:mangrove_apple")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Marri
function aus.grow_marri(pos)
	-- individual parameters
	local height = math_random(15, 20)
	local radius = math_random(7, 10)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:marri_tree")
	local leaves = minetest.get_content_id("australia:marri_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 10, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_marri(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Merbau
function aus.grow_merbau(pos)
	-- individual parameters
	local height = math_random(16, 20)
	local radius = math_random(4, 5)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:merbau_tree")
	local leaves = minetest.get_content_id("australia:merbau_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y - 1, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 3, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_merbau(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Moreton Bay Fig
function aus.grow_moreton_bay_fig(pos)
	-- individual parameters
	local height = math_random(15, 20)
	local radius = math_random(13, 15)
	local limbs = true
	local fruit_chance = 0.2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:moreton_bay_fig_tree")
	local leaves = minetest.get_content_id("australia:moreton_bay_fig_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:moreton_bay_fig")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 15, y = pos.y, z = pos.z - 15},
		{x = pos.x + 15, y = pos.y + height + 15, z = pos.z + 15}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_moreton_bay_fig(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Mulga
function aus.grow_mulga(pos)
	-- individual parameters
	local height = math_random(4, 7)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:mulga_tree")
	local leaves = minetest.get_content_id("australia:mulga_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Paperbark
function aus.grow_paperbark(pos)
	-- individual parameters
	local height = math_random(6, 10)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:paperbark_tree")
	local leaves = minetest.get_content_id("australia:paperbark_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Quandong
function aus.grow_quandong(pos)
	-- individual parameters
	local height = math_random(2, 3)
	local radius = 2
	local limbs = nil
	local fruit_chance = 0.2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:quandong_tree")
	local leaves = minetest.get_content_id("australia:quandong_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local fruit = minetest.get_content_id("australia:quandong")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs, fruit_chance, fruit)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Red Bottlebrush
function aus.grow_red_bottlebrush(pos)
	-- individual parameters
	local height = math_random(2, 3)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:red_bottlebrush_tree")
	local leaves = minetest.get_content_id("australia:red_bottlebrush_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- River Oak
function aus.grow_river_oak(pos)
	-- individual parameters
	local height = math_random(12, 15)
	local radius = math_random(4, 5)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:river_oak_tree")
	local leaves = minetest.get_content_id("australia:river_oak_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- River Red Gum
function aus.grow_river_red_gum(pos)
	-- individual parameters
	local height = math_random(12, 18)
	local radius = math_random(6, 8)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:river_red_gum_tree")
	local leaves = minetest.get_content_id("australia:river_red_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 8, y = pos.y, z = pos.z - 8},
		{x = pos.x + 8, y = pos.y + height + 8, z = pos.z + 8}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_river_red_gum(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Rottnest Island Pine
function aus.grow_rottnest_island_pine(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 3
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:rottnest_island_pine_tree")
	local leaves = minetest.get_content_id("australia:rottnest_island_pine_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 2, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Scribbly Gum
function aus.grow_scribbly_gum(pos)
	-- individual parameters
	local height = math_random(6, 8)
	local radius = math_random(4, 5)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:scribbly_gum_tree")
	local leaves = minetest.get_content_id("australia:scribbly_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 5, y = pos.y, z = pos.z - 5},
		{x = pos.x + 5, y = pos.y + height + 5, z = pos.z + 5}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Shoestring Acacia
function aus.grow_shoestring_acacia(pos)
	-- individual parameters
	local height = math_random(3, 5)
	local radius = math_random(3, 4)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:shoestring_acacia_tree")
	local leaves = minetest.get_content_id("australia:shoestring_acacia_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Snow Gum
function aus.grow_snow_gum(pos)
	-- individual parameters
	local height = math_random(2, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:snow_gum_tree")
	local leaves = minetest.get_content_id("australia:snow_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 4, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Southern Sassafras
function aus.grow_southern_sassafras(pos)
	-- individual parameters
	local height = math_random(7, 13)
	local radius = math_random(3, 4)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:southern_sassafras_tree")
	local leaves = minetest.get_content_id("australia:southern_sassafras_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 2, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_conifer(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Stilted Mangrove
function aus.grow_stilted_mangrove(pos)
	-- individual parameters
	local height = math_random(4, 7)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:stilted_mangrove_tree")
	local leaves = minetest.get_content_id("australia:stilted_mangrove_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y - 1, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 2, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_mangrove(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Sugar Gum
function aus.grow_sugar_gum(pos)
	-- individual parameters
	local height = math_random(9, 13)
	local radius = math_random(8, 10)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:sugar_gum_tree")
	local leaves = minetest.get_content_id("australia:sugar_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 10, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Swamp Bloodwood
function aus.grow_swamp_bloodwood(pos)
	-- individual parameters
	local height = math_random(6, 8)
	local radius = math_random(3, 4)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:swamp_bloodwood_tree")
	local leaves = minetest.get_content_id("australia:swamp_bloodwood_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 4, y = pos.y, z = pos.z - 4},
		{x = pos.x + 4, y = pos.y + height + 4, z = pos.z + 4}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Swamp Gum
function aus.grow_swamp_gum(pos)
	-- individual parameters
	local height = math_random(30, 40)
	local radius = math_random(8, 10)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:swamp_gum_tree")
	local leaves = minetest.get_content_id("australia:swamp_gum_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 10, y = pos.y, z = pos.z - 10},
		{x = pos.x + 10, y = pos.y + height + 12, z = pos.z + 10}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_swamp_gum(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Swamp Paperbark
function aus.grow_swamp_paperbark(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:swamp_paperbark_tree")
	local leaves = minetest.get_content_id("australia:swamp_paperbark_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Tasmanian Myrtle
function aus.grow_tasmanian_myrtle(pos)
	-- individual parameters
	local height = math_random(15, 20)
	local radius = math_random(7, 9)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:tasmanian_myrtle_tree")
	local leaves = minetest.get_content_id("australia:tasmanian_myrtle_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 9, y = pos.y - 1, z = pos.z - 9},
		{x = pos.x + 9, y = pos.y + height + 9, z = pos.z + 9}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tasmanian_myrtle(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Tea Tree
function aus.grow_tea_tree(pos)
	-- individual parameters
	local height = math_random(3, 4)
	local radius = math_random(2, 3)
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:tea_tree_tree")
	local leaves = minetest.get_content_id("australia:tea_tree_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 3, y = pos.y, z = pos.z - 3},
		{x = pos.x + 3, y = pos.y + height + 3, z = pos.z + 3}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- White Box
function aus.grow_white_box(pos)
	-- individual parameters
	local height = math_random(7, 12)
	local radius = math_random(6, 8)
	local limbs = true
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:white_box_tree")
	local leaves = minetest.get_content_id("australia:white_box_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 8, y = pos.y, z = pos.z - 8},
		{x = pos.x + 8, y = pos.y + height + 8, z = pos.z + 8}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore, limbs)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end

-- Wirewood
function aus.grow_wirewood(pos)
	-- individual parameters
	local height = math_random(6, 8)
	local radius = 2
	-- voxelmanip stuff
	local trunk = minetest.get_content_id("australia:wirewood_tree")
	local leaves = minetest.get_content_id("australia:wirewood_leaves")
	local air = minetest.get_content_id("air")
	local ignore = minetest.get_content_id("ignore")
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map(
		{x = pos.x - 2, y = pos.y, z = pos.z - 2},
		{x = pos.x + 2, y = pos.y + height + 2, z = pos.z + 2}
	)
	local area = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()
	aus.make_tree(pos, data, area, height, radius, trunk, leaves, air, ignore)
	vm:set_data(data)
	vm:write_to_map()
	vm:update_map()
end
