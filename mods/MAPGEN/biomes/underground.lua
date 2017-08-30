--[[
	Underground
--]]


-- underground
minetest.register_biome({
	name =            "underground",
	node_stone =      "base:stone",
	y_min =           -31000,
	y_max =           -193,
	heat_point =      50,
	humidity_point =  50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs
