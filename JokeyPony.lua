
SMODS.Atlas {
	key = "MLPJokers",
	path = "MLPJokers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "MLPJokers2",
	path = "MLPJokers2.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "MLPDecks",
	path = "MLPDecks.png",
	px = 71,
	py = 95
}


SMODS.Atlas {
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
}

SMODS.current_mod.optional_features = {
	post_trigger = true
}

assert(SMODS.load_file("items/MLPJokers.lua"))()
assert(SMODS.load_file("items/MLPDecks.lua"))()
assert(SMODS.load_file("items/MLPChallenges.lua"))()
assert(SMODS.load_file("items/MLPCredits.lua"))()