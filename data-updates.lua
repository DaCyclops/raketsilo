local item_sounds = require("__base__.prototypes.item_sounds")
--Items
data:extend({
  {
    type = "item",
    name = "raketsilo_parts",
    icon = "__raketsilo__/graphics/racketsilo_parts.png",
    subgroup = "space-related",
    order = "b[z-raketsilo_parts]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    weight = 0.80 * tons,
    stack_size = 5
  }
})
-- Recipe's
local raketsilo_rec_parts = util.table.deepcopy(data.raw.recipe["rocket-silo"])
raketsilo_rec_parts.name = "raketsilo_parts" 
for k, v in pairs(raketsilo_rec_parts.ingredients ) do
  raketsilo_rec_parts.ingredients[k].amount = math.floor((v.amount / 20) + 0.5)
end
table.insert(raketsilo_rec_parts.ingredients,{type = "item", name = "steel-chest", amount = 1})
table.insert(raketsilo_rec_parts.ingredients,{type = "item", name = "low-density-structure", amount = 2})
raketsilo_rec_parts.energy_required = math.floor((raketsilo_rec_parts.energy_required / 2 ) + 0.5)
raketsilo_rec_parts.results = {{type="item", name="raketsilo_parts", amount=1}}
raketsilo_rec_parts.order = "b[z-raketsilo_parts]"
data.raw.recipe["raketsilo_parts" ] = raketsilo_rec_parts

local raketsilo_rec_assemble  = util.table.deepcopy(data.raw.recipe["rocket-silo"])
raketsilo_rec_assemble.name = "raketsilo_assemble"
raketsilo_rec_assemble.ingredients = {{type="item", name="raketsilo_parts", amount=20}}
raketsilo_rec_assemble.energy_required = raketsilo_rec_assemble.energy_required * 4
raketsilo_rec_assemble.order = "b[z-raketsilo_assemble]"
data.raw.recipe["raketsilo_assemble" ] = raketsilo_rec_assemble

-- Tech Unlocks
table.insert(data.raw["technology"]["rocket-silo"].effects,{type="unlock-recipe",recipe="raketsilo_parts"})
table.insert(data.raw["technology"]["rocket-silo"].effects,{type="unlock-recipe",recipe="raketsilo_assemble"})


