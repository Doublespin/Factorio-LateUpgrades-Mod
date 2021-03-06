
require("config")
require("common")

local minlevel = 7
local maxlevel = 26

for i=minlevel,maxlevel do
	data:extend({
		createupgrade(i, {
			name_prefix = "character-logistic-slots-",
			icon = "__base__/graphics/technology/character-logistic-slots.png",
			pack_r = 1 + ord(7 <= i),		-- Red science
			pack_g = 1 + ord(9 <= i),		-- Green science
			pack_b = 1 + ord(11 <= i),		-- Blue science
			pack_a = 1,						-- Alien science
			time = math.max(30, i * 5),
			count = math.floor(CountFactor * 200 * 2 ^ (i / 2)),
			-- Only 2 slots per upgrade may seem too few, but we'd run out of screen space if we hav many.
			modifier = 2,
			modifiertype = "character-logistic-slots",
			neededscience = "logistic-robotics",
			order = "c-k-e-a" -- Order in science-screen.
		})
	})
end
