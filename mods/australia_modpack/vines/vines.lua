vines.register_vine( 'root', {
  description = "Roots",
  average_length = 8,
},{
  choose_random_wall = true,
  avoid_nodes = {"vines:root_middle"},
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 10,
  spawn_surfaces = {
    "default:dirt_with_grass",
    "default:dirt"
  },
  spawn_on_bottom = true,
  plantlife_limit = -0.6,
  humidity_min = 0.4,
})

vines.register_vine( 'vine', {
  description = "Vines",
  average_length = 5,
},{
  choose_random_wall = true,
  avoid_nodes = {"group:vines"},
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "australia:merbau_leaves"
  },
  spawn_on_bottom = true,
  plantlife_limit = -0.9,
})

vines.register_vine( 'side', {
  description = "Vines",
  average_length = 6,
},{
  choose_random_wall = true,
  avoid_nodes = {"group:vines", "default:apple"},
  choose_random_wall = true,
  avoid_radius = 3,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "australia:merbau_leaves"
  },
  spawn_on_side = true,
  plantlife_limit = -0.9,
})

vines.register_vine( "merbau", {
  description = "Rainforest Vines",
  average_length = 7,
},{
  choose_random_wall = true,
  neighbors = {
    "australia:merbau_leaves"
  },
  avoid_nodes = {
    "vines:merbau_middle",
    "vines:merbau_end",
  },
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "australia:merbau_tree"
  },
  spawn_on_side = true,
  plantlife_limit = -0.9,
  humidity_min = 0.2,
})
