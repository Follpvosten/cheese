local S = minetest.get_translator("cheese")
-- Base item
local CHEESE_ITEM_NAME = "cheese:cheese_piece"
-- Nodes
local CHEESE_ORE_NAME = "cheese:stone_with_cheese"
local CHEESE_BLOCK_NAME = "cheese:cheeseblock"
-- Tools
local CHEESE_SWORD_NAME = "cheese:sword_cheese"
local CHEESE_PICKAXE_NAME = "cheese:pick_cheese"
local CHEESE_SHOVEL_NAME = "cheese:shovel_cheese"
local CHEESE_AXE_NAME = "cheese:axe_cheese"

--
-- Items
--

-- The cheese item used as the base for everything here.
minetest.register_craftitem(CHEESE_ITEM_NAME, {
    description = S("Cheese Piece"),
    inventory_image = "cheese_cheese_piece.png",
    on_use = minetest.item_eat(2),
})
-- Aliases
if minetest.get_modpath("petz") then
    minetest.register_alias_force("petz:cheese", CHEESE_ITEM_NAME)
end
if minetest.get_modpath("mobs_animal") then
    minetest.register_alias_force("mobs:cheese", CHEESE_ITEM_NAME)
end

--
-- Tools
--
minetest.register_tool(CHEESE_SWORD_NAME, {
    description = S("Cheese Sword"),
    inventory_image = "cheese_tool_cheesesword.png",
    tool_capabilities = {
        full_punch_interval = 0.7,
        max_drop_level = 1,
        groupcaps = {
            snappy = {
                -- I'm currently trying to understand what exactly this does. Halp.
                times = { [1]=2.5, [2]=1.20, [3]=0.35 },
                uses = 30,
                maxlevel = 2,
            },
        },
        damage_groups = { fleshy = 6 },
    },
    sound = { breaks = "default_tool_breaks" },
    groups = { sword = 1 },
})
minetest.register_tool(CHEESE_PICKAXE_NAME, {
    description = S("Cheese Pickaxe"),
    inventory_image = "cheese_tool_cheesepick.png",
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 1,
        groupcaps = {
            cracky = {
                times = { [1]=4.00, [2]=1.60, [3]=0.80 },
                uses = 20,
                maxlevel = 2,
            },
        },
        damage_groups = { fleshy = 3 },
    },
    sound = { breaks = "default_tool_breaks" },
    groups = { pickaxe = 1 },
})
minetest.register_tool(CHEESE_SHOVEL_NAME, {
    description = S("Cheese Shovel"),
    inventory_image = "cheese_tool_cheeseshovel.png",
    wield_image = "cheese_tool_cheeseshovel.png^[transformR90",
    tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level = 1,
        groupcaps = {
            crumbly = {
                times = { [1]=1.50, [2]=0.90, [3]=0.40 },
                uses = 30,
                maxlevel = 2,
            },
        },
        damage_groups = { fleshy = 3 },
    },
    sound = { breaks = "default_tool_breaks" },
    groups = { shovel = 1 },
})
minetest.register_tool(CHEESE_AXE_NAME, {
    description = S("Cheese Axe"),
    inventory_image = "cheese_tool_cheeseaxe.png",
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 1,
        groupcaps = {
            choppy = {
                times = { [1]=2.50, [2]=1.40, [3]=1.00 },
                uses = 20,
                maxlevel = 2,
            },
        },
        damage_groups = { fleshy = 4 },
    },
    sound = { breaks = "default_tool_breaks" },
    groups = { axe = 1 },
})
if minetest.get_modpath("3d_armor") then
    -- Register armor
    -- Boots
    local CHEESE_BOOTS_NAME = "cheese:boots_cheese";
    armor:register_armor(CHEESE_BOOTS_NAME, {
        description = S("Cheese Boots"),
        inventory_image = "cheese_armor_boots_inv.png",
        texture = "cheese_armor_boots.png",
        preview = "cheese_armor_boots_preview.png",
        groups = {
            armor_feet = 1,
            armor_heal = 0,
            armor_use = 800,
        },
        armor_groups = { fleshy = 10 },
        damage_groups = { cracky=2, snappy=3, choppy=2, crumbly=1, level=2 },
    })
    minetest.register_craft({
        output = CHEESE_BOOTS_NAME,
        recipe = {
            { CHEESE_ITEM_NAME, "", CHEESE_ITEM_NAME },
            { CHEESE_ITEM_NAME, "", CHEESE_ITEM_NAME },
        }
    })
    minetest.register_alias("cheeseboots", CHEESE_BOOTS_NAME)
    -- Chestplate
    local CHEESE_CHESTPLATE_NAME = "cheese:chestplate_cheese"
    armor:register_armor(CHEESE_CHESTPLATE_NAME, {
        description = S("Cheese Chestplate"),
        inventory_image = "cheese_armor_chestplate_inv.png",
        texture = "cheese_armor_chestplate.png",
        preview = "cheese_armor_chestplate_preview.png",
        groups = {
            armor_torso = 1,
            armor_heal = 0,
            armor_use = 800,
        },
        armor_groups = { fleshy = 15 },
        damage_groups = { cracky=2, snappy=3, choppy=2, crumbly=1, level=2 },
    })
    minetest.register_craft({
        output = CHEESE_CHESTPLATE_NAME,
        recipe = {
            { CHEESE_ITEM_NAME, "",               CHEESE_ITEM_NAME },
            { CHEESE_ITEM_NAME, CHEESE_ITEM_NAME, CHEESE_ITEM_NAME },
            { CHEESE_ITEM_NAME, CHEESE_ITEM_NAME, CHEESE_ITEM_NAME },
        }
    })
    minetest.register_alias("cheesechestplate", CHEESE_CHESTPLATE_NAME)
    -- Helmet
    local CHEESE_HELMET_NAME = "cheese:helmet_cheese";
    armor:register_armor(CHEESE_HELMET_NAME, {
        description = S("Cheese Helmet"),
        inventory_image = "cheese_armor_helmet_inv.png",
        texture = "cheese_armor_helmet.png",
        preview = "cheese_armor_helmet_preview.png",
        groups = {
            armor_head = 1,
            armor_heal = 0,
            armor_use = 800,
        },
        armor_groups = { fleshy = 15 },
        damage_groups = { cracky=2, snappy=3, choppy=2, crumbly=1, level=2 },
    })
    minetest.register_craft({
        output = CHEESE_HELMET_NAME,
        recipe = {
            { CHEESE_ITEM_NAME, CHEESE_ITEM_NAME, CHEESE_ITEM_NAME },
            { CHEESE_ITEM_NAME, "",               CHEESE_ITEM_NAME },
        }
    })
    minetest.register_alias("cheesehelmet", CHEESE_HELMET_NAME)
    -- Leggings
    local CHEESE_LEGGINGS_NAME = "cheese:leggings_cheese"
    armor:register_armor(CHEESE_LEGGINGS_NAME, {
        description = S("Cheese Leggings"),
        inventory_image = "cheese_armor_leggings_inv.png",
        texture = "cheese_armor_leggings.png",
        preview = "cheese_armor_leggings_preview.png",
        groups = {
            armor_legs = 1,
            armor_heal = 0,
            armor_use = 800,
        },
        armor_groups = { fleshy = 15 },
        damage_groups = { cracky=2, snappy=3, choppy=2, crumbly=1, level=2 },
    })
    minetest.register_craft({
        output = CHEESE_LEGGINGS_NAME,
        recipe = {
            { CHEESE_ITEM_NAME, CHEESE_ITEM_NAME, CHEESE_ITEM_NAME },
            { CHEESE_ITEM_NAME, "",               CHEESE_ITEM_NAME },
            { CHEESE_ITEM_NAME, "",               CHEESE_ITEM_NAME },
        }
    })
    minetest.register_alias("cheeseleggings", CHEESE_LEGGINGS_NAME)
end


--
-- Nodes
--

-- Cheese ore - easy way to find cheese, at least that's what it's supposed to be.
minetest.register_node(CHEESE_ORE_NAME, {
    description = S("Cheese Ore"),
    tiles = { "default_stone.png^cheese_mineral_cheese.png" },
    groups = { cracky = 3 },
    drop = {
        max_items = 4,
        items = {
            {
                items = { CHEESE_ITEM_NAME }
            },
            {
                items = { CHEESE_ITEM_NAME },
                rarity = 2
            },
            {
                items = { CHEESE_ITEM_NAME },
                rarity = 3,
            },
            {
                items = { CHEESE_ITEM_NAME },
                rarity = 4,
            },
        },
    },
})
-- Cheese block - for storage and decoration (and possibly portal?)
minetest.register_node(CHEESE_BLOCK_NAME, {
    description = S("Cheese Block"),
    tiles = {
        "cheese_cheese_block_top_bottom.png",
        "cheese_cheese_block_top_bottom.png",
        "cheese_cheese_block_sides.png",
    },
    groups = { cracky = 2, oddly_breakable_by_hand = 1 },
})


--
-- Recipes
--

-- Block
minetest.register_craft({
    type = "shapeless",
    output = CHEESE_BLOCK_NAME,
    recipe = {
        CHEESE_ITEM_NAME,
        CHEESE_ITEM_NAME,
        CHEESE_ITEM_NAME,
        CHEESE_ITEM_NAME,
        CHEESE_ITEM_NAME,
        CHEESE_ITEM_NAME,
        CHEESE_ITEM_NAME,
        CHEESE_ITEM_NAME,
        CHEESE_ITEM_NAME,
    },
})
minetest.register_craft({
    type = "shapeless",
    output = CHEESE_ITEM_NAME .. " 9",
    recipe = {
        CHEESE_BLOCK_NAME,
    },
})
-- Tools
minetest.register_craft({
    output = CHEESE_SWORD_NAME,
    recipe = {
        { CHEESE_ITEM_NAME },
        { CHEESE_ITEM_NAME },
        { "group:stick" },
    }
})
minetest.register_craft({
    output = CHEESE_PICKAXE_NAME,
    recipe = {
        { CHEESE_ITEM_NAME, CHEESE_ITEM_NAME, CHEESE_ITEM_NAME },
        { "", "group:stick", "" },
        { "", "group:stick", "" },
    }
})
minetest.register_craft({
    output = CHEESE_SHOVEL_NAME,
    recipe = {
        { CHEESE_ITEM_NAME },
        { "group:stick" },
        { "group:stick" },
    }
})
minetest.register_craft({
    output = CHEESE_AXE_NAME,
    recipe = {
        { CHEESE_ITEM_NAME, CHEESE_ITEM_NAME },
        { CHEESE_ITEM_NAME, "group:stick" },
        { "",               "group:stick"},
    }
})


--
-- Ore
--
minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_NAME,
    wherein = "default:stone",
    clust_scarcity = 7 * 7 * 7,
    clust_num_ores = 25,
    clust_size = 5,
    y_max = 256,
    y_min = 128,
})
minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_NAME,
    wherein = "default:stone",
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 9,
    clust_size = 3,
    y_max = 127,
    y_min = -127,
})
minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_NAME,
    wherein = "default:stone",
    clust_scarcity = 12 * 12 * 12,
    clust_num_ores = 8,
    clust_size = 3,
    y_max = -128,
    y_min = -512,
})
