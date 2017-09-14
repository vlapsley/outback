# Beds API

This API allows you to add more beds to Outback.

## `beds.register_bed(nodename, {def})`

```lua
    beds.register_bed(
        "beds:bed",    -- Bed name
        def            -- See [#Bed definition]
    )
```

* `beds.read_spawns()`   Returns a table containing players respawn positions
* `beds.kick_players()`  Forces all players to leave bed
* `beds.skip_night()`    Sets world time to morning and saves respawn position of all players currently sleeping

### Bed definition

```lua
    {
        description = "Simple Bed",        -- Item description of item (tooltip), visible to user
        inventory_image = "beds_bed.png",  -- Inventory image (optional, default is an ugly 3D image)
        wield_image = "beds_bed.png",      -- Wield image (optional, default is an ugly 3D image)
        tiles = {
            bottom = {'Tile definition'},  -- The tiles of the bottom part of the bed.
            top = {Tile definition}        -- The tiles of the bottom part of the bed.
        },
        nodebox = {
            bottom = 'regular nodebox',    -- Bottom part of bed (see [Node boxes])
            top = 'regular nodebox',       -- Top part of bed (see [Node boxes])
        },
        selectionbox = 'regular nodebox',  -- For both nodeboxes (see [Node boxes])
        recipe = {                         -- Craft recipe
            {"group:wool", "group:wool", "group:wool"},
            {"group:wood", "group:wood", "group:wood"}
        }
    }
```

### Example

```lua
beds.register_bed("beds:bed", {
    description = "Simple Bed",
    inventory_image = "beds_bed.png",
    wield_image = "beds_bed.png",
    tiles = {
        bottom = {
            "beds_bed_top_bottom.png^[transformR90",
            "default_wood.png",
            "beds_bed_side_bottom_r.png",
            "beds_bed_side_bottom_r.png^[transformfx",
            "beds_transparent.png",
            "beds_bed_side_bottom.png"
        },
        top = {
            "beds_bed_top_top.png^[transformR90",
            "default_wood.png",
            "beds_bed_side_top_r.png",
            "beds_bed_side_top_r.png^[transformfx",
            "beds_bed_side_top.png",
            "beds_transparent.png",
        }
    },
    nodebox = {
        bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
        top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
    },
    selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
    recipe = {
        {"wool:red", "wool:red", "wool:white"},
        {"group:wood", "group:wood", "group:wood"}
    },
})
```
