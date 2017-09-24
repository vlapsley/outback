-- mods/australia_modpack/australia/voxel.lua

-- This is only used to handle cases the decoration manager can't, such as
-- trees alongside rivers.

-- localize math routines for performance
local math_abs = math.abs
local math_exp = math.exp
local math_floor = math.floor
local math_max = math.max


-- Read the noise parameters from the actual mapgen.
local function getCppSettingNoise(name, default)
	local noise
	local n = minetest.setting_get(name)

	if n then
		local parse = {spread = {}}
		local n1, n2, n3, n4, n5, n6, n7, n8, n9
		n1, n2, n3, n4, n5, n6, n7, n8, n9 = string.match(n, '([%d%.%-]+), ([%d%.%-]+), %(([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+)%), ([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+), ([%d%.%-]+)')
		if n9 then
			noise = {offset = tonumber(n1), scale = tonumber(n2),
					seed = tonumber(n6), spread = {x = tonumber(n3),
					y = tonumber(n4), z = tonumber(n5)}, octaves = tonumber(n7),
					persist = tonumber(n8), lacunarity = tonumber(n9)}
		end

	end

	-- Use the default otherwise.
	if not noise then
		noise = default
	end

	return noise
end


-- Define perlin noises used in this mapgen by default
local noises = {}

-- Noise 1 : Base terrain height (2D)
noises[1] = getCppSettingNoise('mg_valleys_np_terrain_height', {
	offset = -10,
	scale = 100,
	seed = 5202,
	spread = {x = 1024, y = 1024, z = 1024},
	octaves = 3,
	persist = 0.7,
	lacunarity = 2,
})

-- Noise 2 : Valleys (2D)
noises[2] = getCppSettingNoise('mg_valleys_np_rivers', {
	offset = 0,
	scale = 1,
	seed = -6050,
	spread = {x = 512, y = 512, z = 512},
	octaves = 5,
	persist = 0.6,
	lacunarity = 2,
})

-- Noise 3 : Valleys Depth (2D)
noises[3] = getCppSettingNoise('mg_valleys_np_valley_depth', {
	offset = 3,
	scale = 2,
	seed = -1914,
	spread = {x = 512, y = 512, z = 512},
	octaves = 1,
	persist = 1,
	lacunarity = 2,
})

-- Noise 4 : Valleys Profile (2D)
noises[4] = getCppSettingNoise('mg_valleys_np_valley_profile', {
	offset = 0.6,
	scale = 0.5,
	seed = 777,
	spread = {x = 512, y = 512, z = 512},
	octaves = 4,
	persist = 1,
	lacunarity = 2,
})

-- Noise 5 : Inter-valleys slopes (2D)
noises[5] = getCppSettingNoise('mg_valleys_np_inter_valley_slope', {
	offset = 0,
	scale = 1,
	seed = 746,
	spread = {x = 256, y = 256, z = 256},
	octaves = 3,
	persist = 0.5,
	lacunarity = 2,
})

-- Noise 6 : Inter-valleys filling (3D)
noises[6] = getCppSettingNoise('mg_valleys_np_inter_valley_fill', {
	offset = 0,
	scale = 1,
	seed = 1993,
	spread = {x = 512, y = 256, z = 512},
	octaves = 6,
	persist = 0.8,
	lacunarity = 2,
	})

-- Noise 20 : Salt lakes (2D)
noises[20] = {
	offset = 0,
	scale = 1,
	seed = 1964,
	spread = {x = 16, y = 16, z = 16},
	octaves = 3,
	persist = 0.5,
	lacunarity = 2,
}

-- function to get noisemaps
local function noisemap(i, minp, chulens)
	local obj = minetest.get_perlin_map(noises[i], chulens)
	if minp.z then
		return obj:get3dMap_flat(minp)
	else
		return obj:get2dMap_flat(minp)
	end
end

-- List of functions to run at the end of the mapgen procedure
aus.after_mapgen = {}

function aus.register_after_mapgen(f, ...)
	table.insert(aus.after_mapgen, {f = f, ...})
end

function aus.execute_after_mapgen()
	for i, params in ipairs(aus.after_mapgen) do
		params.f(unpack(params))
	end
	aus.after_mapgen = {}
end

local function getCppSettingNumeric(name, default)
	local setting = minetest.setting_get(name)

	if setting and tonumber(setting) then
		setting = tonumber(setting)
	else
		setting = default
	end

	return setting
end

-- Rocky beaches
function rock_beach(x, y, z, a, data)
	local c_granite = minetest.get_content_id("technic:granite")
	local dx = math.random() * 15 + 1
	local dy = math.random() * 15 + 1
	local dz = math.random() * 15 + 1
	for k = -8, 8 do
		for j = -8, 8 do
			local vi = a:index(x-8, y+j, z+k)
			for i = -8, 8 do
				if (i ^ 2 * dx + j ^ 2 * dy + k ^ 2 * dz) ^ 0.5 < 8 then
					data[vi] = c_granite
				end
				vi = vi + 1
			end
		end
	end
end

-- Define parameters
local river_size = 4 / 100

-- This table holds the content IDs. They aren't available until
-- the actual mapgen loop is run, but they can stay local to the
-- file rather than having to load them for every map chunk.
--
local node = {}

-- Create a table of biome ids, so I can use the biomemap.
if not aus.biome_ids then
	local i
	aus.biome_ids = {}
	for name, desc in pairs(minetest.registered_biomes) do
		i = minetest.get_biome_id(desc.name)
		aus.biome_ids[i] = desc.name
	end
end

local data = {}

-- THE MAPGEN FUNCTION
minetest.register_on_generated(function(minp, maxp, seed)
	if aus.registered_on_first_mapgen then  -- Run callbacks
		for _, f in ipairs(aus.registered_on_first_mapgen) do
			f()
		end
		aus.registered_on_first_mapgen = nil
		aus.register_on_first_mapgen = nil
	end

	-- minp and maxp strings, used by logs
	local minps, maxps = minetest.pos_to_string(minp), minetest.pos_to_string(maxp)
	-- print("[MOD: Australia] Generating map from " .. minps .. " to " .. maxps .. " ...")
	-- start the timer
	local t0 = os.clock()

	-- Define content IDs
	-- A content ID is a number that represents a node in the core of Minetest.
	-- Every nodename has its ID.
	-- The VoxelManipulator uses content IDs instead of nodenames.
	if not node["stone"] then
		node["stone"] = minetest.get_content_id("default:stone")
		node["sandstone"] = minetest.get_content_id("default:sandstone")
		node["dirt"] = minetest.get_content_id("default:dirt")
		node["lawn"] = minetest.get_content_id("default:dirt_with_grass")
		node["dry"] = minetest.get_content_id("default:dirt_with_dry_grass")
		node["snowblock"] = minetest.get_content_id("default:snowblock")
		node["desert_sand"] = minetest.get_content_id("default:desert_sand")
		node["sand"] = minetest.get_content_id("default:sand")
		node["red_dirt"] = minetest.get_content_id("base:red_dirt")
		node["red_gravel"] = minetest.get_content_id("base:red_gravel")
		node["red_sand"] = minetest.get_content_id("base:red_sand")
		node["mud"] = minetest.get_content_id("base:mangrove_mud")
		node["salt"] = minetest.get_content_id("base:mineral_salt")
		-- Water
		node["water"] = minetest.get_content_id("default:water_source")
		node["muddy_water"] = minetest.get_content_id("base:muddy_water_source")
		-- Air and Ignore
		node["air"] = minetest.get_content_id("air")
		node["ignore"] = minetest.get_content_id("ignore")
	end

	-- The VoxelManipulator, a complicated but speedy method to set many nodes at the same time
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	-- The VoxelArea is used to convert a position into an index for the array.
	local a = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
	vm:get_data(data)  -- data is the original array of content IDs (solely or mostly air)
	-- Be careful: emin ≠ minp and emax ≠ maxp !
	-- The data array is not limited by minp and maxp. It exceeds it by 16 nodes in the 6 directions.
	-- The real limits of data array are emin and emax.
	-- Tip : the ystride of a VoxelArea is the number to add to the array index to get the index of the position above.
	-- It's faster because it avoids to completely recalculate the index.
	local ystride = a.ystride 

	-- The biomemap is a table of biome index numbers for each horizontal
	-- location. It's created in the mapgen, and is right most of the time.
	-- It's off in about 1% of cases, for various reasons.
	-- Bear in mind that biomes can change from one voxel to the next.
	local biomemap = minetest.get_mapgen_object("biomemap")
	local heightmap = minetest.get_mapgen_object("heightmap")

	-- Calculate the noise values
	local minp2d = {x = minp.x, y = minp.z}
	local chulens = vector.add(vector.subtract(maxp, minp), 1)  -- Size of the generated area, used by noisemaps
	local chulens_sup = {x = chulens.x, y = chulens.y + 6, z = chulens.z}  -- for noise #6 that needs extra values

	local n1 = noisemap(1, minp2d, chulens)
	local n2 = noisemap(2, minp2d, chulens)
	local n3 = noisemap(3, minp2d, chulens)
	local n4 = noisemap(4, minp2d, chulens)
	local n5 = noisemap(5, minp2d, chulens)
	local n6 = noisemap(6, minp, chulens_sup)
	local n20 = noisemap(20, minp2d, chulens)


	-- THE CORE OF THE MOD: THE MAPGEN ALGORITHM ITSELF
	-- indexes for noise arrays
	local i2d = 1  -- index for 2D noises
	local i3d_sup = 1  -- index for noise #6 which has a special size

	-- Calculate increments
	local i2d_incrZ = chulens.z
	local i2d_decrX = chulens.x * chulens.z - 1
	local biome

	for x = minp.x, maxp.x do  -- for each YZ plane
		for z = minp.z, maxp.z do  -- for each vertical line in this plane
			local air_count = 0
			-- take the noise values for 2D noises
			local v1, v2, v3, v4, v5, v20 =
					n1[i2d], n2[i2d], n3[i2d], n4[i2d], n5[i2d], n20[i2d]

			-- Check for a salt lakes and rocky beaches
			biome = aus.biome_ids[biomemap[i2d]]
			local saltlake, rocky_beach = nil
			if table.contains({"simpson_desert"}, biome) and v20 > 0.8 then
				saltlake = true
			end
			if table.contains({"mangroves"}, biome) then
				rocky_beach = false
			elseif table.contains({"tasman_sea", "indian_ocean", "great_australian_bight"},
					biome) then
				rocky_beach = true
			end

			for y = maxp.y, minp.y, -1 do  -- for each node in vertical line
				local ivm = a:index(x, y, z)  -- index of the data array, matching the position {x, y, z}
				local v6 = n6[i3d_sup]  -- take the noise values for 3D noises
				local ground = math_max(heightmap[i2d], 0) - 5

				-- Check for suitable ground node
				if data[ivm] == node["dirt"]
					or data[ivm] == node["dry"]
					or data[ivm] == node["lawn"]
					or data[ivm] == node["desert_sand"]
					or data[ivm] == node["stone"]
					or data[ivm] == node["sand"]
					or data[ivm] == node["mud"]
					or data[ivm] == node["red_dirt"]
					or data[ivm] == node["red_gravel"]
					or data[ivm] == node["red_sand"]
					or data[ivm] == node["snowblock"] then

					-- a top node
					if y >= ground and data[ivm + ystride] == node["air"] then

						-- The square function changes the behaviour of this noise : very often
						-- small, and sometimes very high.
						v3 = v3 ^ 2
						-- v3 is here because terrain is generally higher where valleys are deep
						-- (mountains). base_ground represents the height of the rivers, most of
						-- the surface is above.
						local base_ground = v1 + v3
						-- v2 represents the distance from the river, in arbitrary units.
						v2 = math_abs(v2) - river_size
						-- The rivers are placed where v2 is negative, so where the original v2
						-- value is close to zero.
						local river = v2 < 0
						-- Use the curve of the function 1−exp(−(x/a)²) to modelise valleys. Making
						-- "a" varying 0 < a ≤ 1 changes the shape of the valleys. Try it with a
						-- geometry software! (here x = v2 and a = v4). This variable represents
						-- the height of the terrain, from the rivers.
						local valleys = v3 * (1 - math_exp(- (v2 / v4) ^ 2))
						-- Approximate height of the terrain at this point (could be slightly
						-- modified by the 3D noise #6)
						local mountain_ground = base_ground + valleys
						-- This variable represents the maximal influence of the noise #6 on the
						-- elevation. v5 is the rate of the height from rivers (variable "valleys")
						-- that is concerned.
						local slopes = v5 * valleys

						-- Salt lakes
						if saltlake and y < 20 and slopes < 0 and v2 > 0.1 and
								v2 < 0.2 and data[ivm] == node["red_sand"] then
							data[ivm] = node["salt"]
						end

						-- Rocky beaches
						if rocky_beach and v6 > 0.5 and v2 > 0.15 and y < 2 then
							rock_beach(x, y, z, a, data)
						end

						-- Plants and trees
						local conditions = {  -- pack it in a table, for plants API
							v1 = v1,
							v2 = v2,
							v3 = v3,
							v4 = v4,
							v5 = v5,
							v6 = v6,
							base_ground = base_ground,
							river = river,
							valleys = valleys,
							mountain_ground = mountain_ground,
							slopes = slopes,
							biome = aus.biome_ids[biomemap[i2d]]
							}
						plants_api.choose_generate_plant(conditions,
								{x=x,y=y+1,z=z}, data, a, ivm + ystride)
					end
				end

				if data[ivm] ~= node["air"] then
					air_count = 0
				end

			end
			i2d = i2d + i2d_incrZ  -- Increment i2d by one Z
		end
		i2d = i2d - i2d_decrX  -- Decrement the Z line previously incremented and increment by one X (1)
	end
	aus.execute_after_mapgen()  -- Needed for some tree roots

	-- Execute voxelmanip boring stuff to write to the map...
	vm:set_data(data)
	-- vm:set_lighting({day = 0, night = 0})
	vm:calc_lighting()
	vm:update_liquids()
	vm:write_to_map()

	local t1 = os.clock()
	-- print("[MOD: Australia] Mapgen finished in " .. displaytime(t1-t0))

	-- Garbage collection
	local mem = math_floor(collectgarbage("count")/1024)
	if mem > 500 then
		core.log("action", "MOD: Australia is manually collecting garbage as memory use has exceeded 500MB.")
		collectgarbage("collect")
	end

end)
