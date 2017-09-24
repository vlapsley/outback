
-- Sulfur
local sulfur_buf = {}
local sulfur_noise= nil

minetest.register_on_generated(function(minp, maxp, seed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local a = VoxelArea:new{
		MinEdge = {x = emin.x, y = emin.y, z = emin.z},
		MaxEdge = {x = emax.x, y = emax.y, z = emax.z},
	}
	local data = vm:get_data(sulfur_buf)
	local pr = PseudoRandom(17 * minp.x + 42 * minp.y + 101 * minp.z)
	sulfur_noise = sulfur_noise or minetest.get_perlin(9876, 3, 0.5, 100)

	local c_lava = minetest.get_content_id("default:lava_source")
	local c_lava_flowing = minetest.get_content_id("default:lava_flowing")
	local c_stone = minetest.get_content_id("default:stone")
	local c_sulfur = minetest.get_content_id("technic:mineral_sulfur")

	local grid_size = 5
	for x = minp.x + math.floor(grid_size / 2), maxp.x, grid_size do
	for y = minp.y + math.floor(grid_size / 2), maxp.y, grid_size do
	for z = minp.z + math.floor(grid_size / 2), maxp.z, grid_size do
		local c = data[a:index(x, y, z)]
		if (c == c_lava or c == c_lava_flowing) and sulfur_noise:get3d({x = x, y = z, z = z}) >= 0.4 then
			for xx = math.max(minp.x, x - grid_size), math.min(maxp.x, x + grid_size) do
			for yy = math.max(minp.y, y - grid_size), math.min(maxp.y, y + grid_size) do
			for zz = math.max(minp.z, z - grid_size), math.min(maxp.z, z + grid_size) do
				local i = a:index(xx, yy, zz)
				if data[i] == c_stone and pr:next(1, 10) <= 7 then
					data[i] = c_sulfur
				end
			end
			end
			end
		end
	end
	end
	end

	vm:set_data(data)
	vm:write_to_map(data)
end)

