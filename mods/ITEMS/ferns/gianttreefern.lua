-----------------------------------------------------------------------------------------------
-- Ferns - Giant Tree Fern 0.1.1
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		biome_lib
-- Looked at code from:		4seasons, default
-- Supports:				vines
-----------------------------------------------------------------------------------------------

assert(abstract_ferns.config.enable_giant_treefern == true)

-- support for i18n
local S = plantlife_i18n.gettext
-- lot of code, lot to load

abstract_ferns.grow_giant_tree_fern = function(pos)
	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	if minetest.get_node(pos_01).name ~= "air"
			and minetest.get_node(pos_01).name ~= "ferns:sapling_giant_tree_fern"
			and minetest.get_node(pos_01).name ~= "base:junglegrass" then
		return
	end

	local size = math.random(4,8)	-- min of range must be >= 4

	local leafchecks = {
		{
			direction  = 3,
			positions = {
				{x = pos.x + 1, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x + 2, y = pos.y + size    , z = pos.z    },
				{x = pos.x + 3, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x + 4, y = pos.y + size - 2, z = pos.z    }
			}
		},
		{
			direction  = 1,
			positions = {
				{x = pos.x - 1, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x - 2, y = pos.y + size,     z = pos.z    },
				{x = pos.x - 3, y = pos.y + size - 1, z = pos.z    },
				{x = pos.x - 4, y = pos.y + size - 2, z = pos.z    }
			}
		},
		{
			direction  = 2,
			positions = {
				{x = pos.x    , y = pos.y + size - 1, z = pos.z + 1},
				{x = pos.x    , y = pos.y + size    , z = pos.z + 2},
				{x = pos.x    , y = pos.y + size - 1, z = pos.z + 3},
				{x = pos.x    , y = pos.y + size - 2, z = pos.z + 4}
			}
		},
		{
			direction  = 0,
			positions = {
				{x = pos.x    , y = pos.y + size - 1, z = pos.z - 1},
				{x = pos.x    , y = pos.y + size    , z = pos.z - 2},
				{x = pos.x    , y = pos.y + size - 1, z = pos.z - 3},
				{x = pos.x    , y = pos.y + size - 2, z = pos.z - 4}
			}
		}
	}

	local brk = false
	for i = 1, size-3 do
		if minetest.get_node({x = pos.x, y = pos.y + i, z = pos.z}).name ~= "air" then
			brk = true
			break
		end
		minetest.set_node({x = pos.x, y = pos.y + i, z = pos.z}, {name="ferns:fern_trunk_big"})
	end
	if not brk then
		minetest.set_node({x = pos.x, y = pos.y + size-2, z = pos.z}, {name="ferns:fern_trunk_big_top"})
		minetest.set_node({x = pos.x, y = pos.y + size-1, z = pos.z}, {name="ferns:tree_fern_leaves_giant"})

		-- all the checking for air below is to prevent some ugly bugs (incomplete trunks of neighbouring trees), it's a bit slower, but worth the result

		-- assert(#leafchecks == 4)
		for i = 1, 4 do
			local positions = leafchecks[i].positions
			local rot = leafchecks[i].direction
			local endpos = 4	-- If the loop below adds all intermediate leaves then the "terminating" leaf will be at positions[4]
			-- assert(#positions == 4)
			-- add leaves so long as the destination nodes are air
			for j = 1, 3 do
				if minetest.get_node(positions[j]).name == "air" then
					minetest.set_node(positions[j], {name="ferns:tree_fern_leave_big"})
				else
					endpos = j
					break
				end
			end
			-- add the terminating leaf if required and possible
			if endpos == 4 and minetest.get_node(positions[endpos]).name == "air" then
				minetest.set_node(positions[endpos], {name="ferns:tree_fern_leave_big_end", param2=rot})
			end
		end
	end
end

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN LEAVES
-----------------------------------------------------------------------------------------------
minetest.register_node("ferns:tree_fern_leaves_giant", {
	description = S("Tree Fern Crown (Dicksonia)"),
	drawtype = "plantlike",
	visual_scale = math.sqrt(11),
	wield_scale = {x=0.175, y=0.175, z=0.175},
	paramtype = "light",
	tiles = {"ferns_fern_tree_giant.png"},
	inventory_image = "ferns_fern_tree.png",
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		attached_node=1,
		not_in_creative_inventory=1
	},
	drop = {
		max_items = 2,
		items = {
			{
				-- occasionally, drop a second sapling instead of leaves
				-- (extra saplings can also be obtained by replanting and
				--  reharvesting leaves)
				items = {"ferns:sapling_giant_tree_fern"},
				rarity = 10,
			},
			{
				items = {"ferns:sapling_giant_tree_fern"},
			},
			{
				items = {"ferns:tree_fern_leaves_giant"},
			}
		}
	},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN LEAVE PART
-----------------------------------------------------------------------------------------------
minetest.register_node("ferns:tree_fern_leave_big", {
	description = S("Giant Tree Fern Leaves"),
	drawtype = "raillike",
	paramtype = "light",
	tiles = {
		"ferns_tree_fern_leave_big.png",
	},
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		attached_node=1,
		not_in_creative_inventory=1
	},
	drop = "",
	sounds = base.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN LEAVE END
-----------------------------------------------------------------------------------------------
minetest.register_node("ferns:tree_fern_leave_big_end", {
	description = S("Giant Tree Fern Leave End"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = { "ferns_tree_fern_leave_big_end.png" },
	walkable = false,
	node_box = {
		type = "fixed",
--			    {left, bottom, front, right, top,   back }
		fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
	},
	groups = {
		snappy=3,
		flammable=2,
		attached_node=1,
		not_in_creative_inventory=1
	},
	drop = "",
	sounds = base.node_sound_leaves_defaults(),
})

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN TRUNK TOP
-----------------------------------------------------------------------------------------------
minetest.register_node("ferns:fern_trunk_big_top", {
	description = S("Giant Fern Trunk"),
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"ferns_fern_trunk_big_top.png^ferns_tree_fern_leave_big_cross.png",
		"ferns_fern_trunk_big_top.png^ferns_tree_fern_leave_big_cross.png",
		"ferns_fern_trunk_big.png"
	},
	node_box = {
		type = "fixed",
--			{left, bottom, front, right, top,   back }
		fixed = {
			{-1/2,  33/64, -1/2, 1/2, 33/64, 1/2},
			{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	groups = {
		tree=1,
		choppy=2,
		oddly_breakable_by_hand=2,
		flammable=3,
		wood=1,
		not_in_creative_inventory=1,
		leafdecay=3 -- to support vines
	},
	drop = "ferns:fern_trunk_big",
	sounds = base.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN TRUNK
-----------------------------------------------------------------------------------------------
minetest.register_node("ferns:fern_trunk_big", {
	description = S("Giant Fern Trunk"),
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"ferns_fern_trunk_big_top.png",
		"ferns_fern_trunk_big_top.png",
		"ferns_fern_trunk_big.png"
	},
	node_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = base.node_sound_wood_defaults(),
	after_destruct = function(pos,oldnode)
        local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
        if node.name == "ferns:fern_trunk_big" or node.name == "ferns:fern_trunk_big_top" then
            minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z})
            minetest.add_item(pos,"ferns:fern_trunk_big")
        end
    end,
})

-----------------------------------------------------------------------------------------------
-- GIANT TREE FERN SAPLING
-----------------------------------------------------------------------------------------------
minetest.register_node("ferns:sapling_giant_tree_fern", {
	description = S("Giant Tree Fern Sapling"),
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"ferns_sapling_tree_fern_giant.png"},
	inventory_image = "ferns_sapling_tree_fern_giant.png",
	walkable = false,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = base.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})

-- abm
minetest.register_abm({
	nodenames = "ferns:sapling_giant_tree_fern",
	interval = 1000,
	chance = 4,
	action = function(pos, node, _, _)
		abstract_ferns.grow_giant_tree_fern({x = pos.x, y = pos.y-1, z = pos.z})
    end
})

-----------------------------------------------------------------------------------------------
-- GENERATE GIANT TREE FERN
-----------------------------------------------------------------------------------------------

-- in Victorian-Forests and Tasmania biomes
if abstract_ferns.config.enable_giant_treeferns_in_victas == true then
	biome_lib:register_generate_plant({
		surface = {"base:dirt_with_grass"},
		max_count = 30,
		avoid_nodes = {"group:tree"},
		avoid_radius = 3,
		rarity = 66,
		seed_diff = 329,
		min_elevation = 5,
		near_nodes = {"base:blue_gum_tree",
			"base:swamp_gum_tree",
			"base:tasmanian_myrtle_tree"},
		near_nodes_size = 6,
		near_nodes_vertical = 2,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
	},
	abstract_ferns.grow_giant_tree_fern
	)
end

-- In Far North Queensland biome
if abstract_ferns.config.enable_giant_treeferns_in_fnq == true then
	biome_lib:register_generate_plant({
		surface = {"base:dirt_with_grass"},
		max_count = 20,
		rarity = 66,
		seed_diff = 329,
		min_elevation = 5,
		max_elevation = 25,
		near_nodes = {"base:merbau_tree"},
		near_nodes_size = 6,
		near_nodes_vertical = 2,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
	},
	abstract_ferns.grow_giant_tree_fern
	)
end

