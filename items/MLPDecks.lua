

-- Equestrian Deck
SMODS.Back{
  name = "Equestrian Deck",
	key = "MLPEquestriaDeck",  
  loc_txt = {      
    name = 'Equestrian Deck',      
    text = {
        "Start run with a",
        "random {C:attention}JokeyPony{} Joker,",
        "JokeyPony Jokers appear",
		"{C:attention}3X{} more often"
    } 
  }, 
	order = 16,
  unlocked = true,
  discovered = true,
	config = {},
	pos = { x = 0, y = 0 },
	atlas = "MLPDecks"
}
 

 SMODS.Back{ -- Tricksy Deck
    name = "Tricksy Deck",
	key = "MLPTricksyDeck",  
	order = 16,
  unlocked = true,
  discovered = true,
	config = {vouchers = {"v_magic_trick","v_illusion"}},
  loc_vars = function(self, info_queue, center)
    return {vars = {localize{type = 'name_text', key = 'v_magic_trick', set = 'Voucher'}, localize{type = 'name_text', key = 'v_illusion', set = 'Voucher'}}}
	end,
	apply = function(self, back)
	G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
  end,
	pos = { x = 1, y = 0 },
	atlas = "MLPDecks"
}


 SMODS.Back{ -- Our Deck
    name = "Our Deck",
	key = "MLPOurDeck",  
	order = 16,
  unlocked = true,
  discovered = true,
	apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
              local ourdeck_card = pseudorandom_element(G.playing_cards, pseudoseed('lifeissogrand' .. G.GAME.round_resets.ante))
                for i = #G.playing_cards, 1, -1 do
                      SMODS.change_base(G.playing_cards[i], ourdeck_card.base.suit, ourdeck_card.base.value)
                end
            return true
            end
        }))
	G.GAME.starting_params.ante_scaling = 5
  end,
	pos = { x = 2, y = 0 },
	atlas = "MLPDecks"
}