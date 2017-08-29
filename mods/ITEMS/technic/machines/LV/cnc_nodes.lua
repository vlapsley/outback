-- REGISTER MATERIALS AND PROPERTIES FOR NONCUBIC ELEMENTS:
-----------------------------------------------------------

local S = technic.getter

-- DIRT
-------
technic.cnc.register_all("base:dirt",
                {snappy=2,choppy=2,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
                {"base_grass.png", "base_dirt.png", "base_grass.png"},
                S("Dirt"))
-- WOOD
-------
technic.cnc.register_all("base:wood",
                {snappy=2, choppy=2, oddly_breakable_by_hand=2, not_in_creative_inventory=1},
                {"base_wood.png"},
                S("Wooden"))
-- STONE
--------
technic.cnc.register_all("base:stone",
                {cracky=3, not_in_creative_inventory=1},
                {"base_stone.png"},
                S("Stone"))
-- COBBLE
---------
technic.cnc.register_all("base:cobble",
                {cracky=3, not_in_creative_inventory=1},
                {"base_cobble.png"},
                S("Cobble"))
-- BRICK
--------
technic.cnc.register_all("base:brick",
                {cracky=3, not_in_creative_inventory=1},
                {"base_brick.png"},
                S("Brick"))

-- SANDSTONE
------------
technic.cnc.register_all("base:sandstone",
                {crumbly=2, cracky=3, not_in_creative_inventory=1},
                {"base_sandstone.png"},
                S("Sandstone"))

-- LEAVES
---------
technic.cnc.register_all("base:leaves",
                {snappy=2, choppy=2, oddly_breakable_by_hand=3, not_in_creative_inventory=1},
                {"base_leaves.png"},
                S("Leaves"))
-- TREE
-------
technic.cnc.register_all("base:tree",
                {snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=3, wood=1, not_in_creative_inventory=1},
                {"base_tree.png"},
                S("Tree"))

-- WROUGHT IRON
---------------
technic.cnc.register_all("base:steelblock",
                {cracky=1, level=2, not_in_creative_inventory=1},
                {"technic_wrought_iron_block.png"},
                S("Wrought Iron"))

-- Bronze
--------
technic.cnc.register_all("base:bronzeblock",
                {cracky=1, level=2, not_in_creative_inventory=1},
                {"base_bronze_block.png"},
                S("Bronze"))

-- Stainless Steel
--------
technic.cnc.register_all("technic:stainless_steel_block",
                {cracky=1, level=2, not_in_creative_inventory=1},
                {"technic_stainless_steel_block.png"},
                S("Stainless Steel"))

-- Marble
------------
technic.cnc.register_all("base:marble",
                {cracky=3, not_in_creative_inventory=1},
                {"base_marble.png"},
                S("Marble"))

-- Granite
------------
technic.cnc.register_all("base:granite",
                {cracky=1, not_in_creative_inventory=1},
                {"base_granite.png"},
                S("Granite"))

