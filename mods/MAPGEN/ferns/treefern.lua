-----------------------------------------------------------------------------------------------
-- Ferns - Tree Fern 0.1.1
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		biome_lib
-- Looked at code from:		default	, trees
-----------------------------------------------------------------------------------------------

-- support for i18n
local S = plantlife_i18n.gettext

assert(abstract_ferns.config.enable_treefern == true)

abstract_ferns.grow_tree_fern = function(pos)

	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	if minetest.get_node(pos_01).name ~= "air"
			and minetest.get_node(pos_01).name ~= "ferns:sapling_tree_fern"
			and minetest.get_node(pos_01).name ~= "default:junglegrass" then
		return
	end

	local size = math.random(1, 4) + math.random(1, 4)
	if (size > 5) then
		size = 10 - size
	end
	size = size + 1
	local crown = ({ "ferns:tree_fern_leaves", "ferns:tree_fern_leaves_02" })[math.random(1, 2)]

	local i = 1
	local brk = false
	while (i < size) do
		print(minetest.get_node({x = pos.x, y = pos.y + i, z = pos.z}).name)
		if minetest.get_node({x = pos.x, y = pos.y + i, z = pos.z}).name ~= "air" then
			brk = true
			print("break!")
			break
		end
		print("set trunk node at:")
		print(dump({x = pos.x, y = pos.y + i, z = pos.z}))
		minetest.set_node({x = pos.x, y = pos.y + i, z = pos.z}, { name = "ferns:fern_trunk" })
		i = i + 1
	end
	if not brk then
		print("set crown node at:")
		print(dump({x = pos.x, y = pos.y + i, z = pos.z}))
		minetest.set_node({x = pos.x, y = pos.y + i - 1, z = pos.z}, { name = crown })
	end
end

-----------------------------------------------------------------------------------------------
-- TREE FERN LEAVES
-----------------------------------------------------------------------------------------------

-- TODO: Both of these nodes look the same?

minetest.register_node("ferns:tree_fern_leaves", {
	description = S("Tree Fern Crown (Dicksonia)"),
	drawtype = "plantlike",
	visual_scale = math.sqrt(8),
	paramtype = "light",
	paramtype2 = "facedir",
	--tiles = {"[combine:32x32:0,0=top_left.png:0,16=bottom_left.png:16,0=top_right.png:16,16=bottom_right.png"},
	tiles = {"ferns_fern_tree.png"},
	inventory_image = "ferns_fern_tree_inv.png",
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1},
	drop = {
		max_items = 2,
		items = {
			{
				-- occasionally, drop a second sapling instead of leaves
				-- (extra saplings can also be obtained by replanting and
				--  reharvesting leaves)
				items = {"ferns:sapling_tree_fern"},
				rarity = 10,
			},
			{
				items = {"ferns:sapling_tree_fern"},
			},
			{
				items = {"ferns:tree_fern_leaves"},
			}
		}
	},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
minetest.register_node("ferns:tree_fern_leaves_02", {
	drawtype = "plantlike",
	visual_scale = math.sqrt(8),
	paramtype = "light",
	tiles = {"ferns_fern_big.png"},
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1,not_in_creative_inventory=1},
	drop = {
		max_items = 2,
		items = {
			{
				-- occasionally, drop a second sapling instead of leaves
				-- (extra saplings can also be obtained by replanting and
				--  reharvesting leaves)
				items = {"ferns:sapling_tree_fern"},
				rarity = 10,
			},
			{
				items = {"ferns:sapling_tree_fern"},
			},
			{
				items = {"ferns:tree_fern_leaves"},
			}
		}
	},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
-----------------------------------------------------------------------------------------------
-- FERN TRUNK
-----------------------------------------------------------------------------------------------
minetest.register_node("ferns:fern_trunk", {
	description = S("Fern Trunk (Dicksonia)"),
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"ferns_fern_trunk_top.png",
		"ferns_fern_trunk_top.png",
		"ferns_fern_trunk.png"
	},
	node_box = {
		type = "fixed",
		fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = core.node_sound_wood_defaults(),
	after_destruct = function(pos,oldnode)
        local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
        if node.name == "ferns:fern_trunk" then
            minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z})
            minetest.add_item(pos,"ferns:fern_trunk")
        end
    end,
})

-----------------------------------------------------------------------------------------------
-- TREE FERN SAPLING
-----------------------------------------------------------------------------------------------
minetest.register_node("ferns:sapling_tree_fern", {
	description = S("Tree Fern Sapling (Dicksonia)"),
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"ferns_sapling_tree_fern.png"},
	inventory_image = "ferns_sapling_tree_fern.png",
	walkable = false,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = core.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
-- abm
minetest.register_abm({
	nodenames = "ferns:sapling_tree_fern",
	interval = 1000,
	chance = 4,
	action = function(pos, node, _, _)
		abstract_ferns.grow_tree_fern({x = pos.x, y = pos.y-1, z = pos.z})
    end
})

-----------------------------------------------------------------------------------------------
-- GENERATE TREE FERN
-----------------------------------------------------------------------------------------------

-- in Victorian-Forests and Tasmania biomes
if abstract_ferns.config.enable_treeferns_in_victas == true then
	biome_lib:register_generate_plant({
		surface = {"default:dirt_with_grass"},
		max_count = 60,
		avoid_nodes = {"group:tree"},
		avoid_radius = 2,
		rarity = 50,
		seed_diff = 329,
		min_elevation = 5,
		near_nodes = {"australia:blue_gum_tree",
			"australia:swamp_gum_tree",
			"australia:tasmanian_myrtle_tree"},
		near_nodes_size = 6,
		near_nodes_vertical = 2,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
	},
	abstract_ferns.grow_tree_fern
	)
end

-- In Far North Queensland biome
if abstract_ferns.config.enable_treeferns_in_fnq == true then
	biome_lib:register_generate_plant({
		surface = {"default:dirt_with_grass"},
		max_count = 40,
		rarity = 50,
		seed_diff = 329,
		min_elevation = 4,
		max_elevation = 25,
		near_nodes = {"australia:merbau_tree"},
		near_nodes_size = 2,
		near_nodes_vertical = 1,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
	},
	abstract_ferns.grow_tree_fern
)
end