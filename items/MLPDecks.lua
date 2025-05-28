

-- Equestrian Deck
 -- SMODS.Back{
    -- name = "Equestrian Deck",
	-- key = "MLPEquDeck",  
  -- loc_txt = {      
    -- name = 'Equestrian Deck',      
    -- text = {
        -- "Start run with a",
        -- "random {C:attention}JokeyPony{} Joker,",
        -- "JokeyPony Jokers appear",
		-- "{C:attention}3X{} more often"
    -- } 
  -- }, 
	-- order = 16,
  -- unlocked = true,
  -- discovered = true,
	-- config = {},
	-- pos = { x = 0, y = 0 },
	-- atlas = "MLPDecks"
-- }
 

 SMODS.Back{ -- Tricksy Deck
    name = "Tricksy Deck",
	key = "MLPTricksyDeck",  
  loc_txt = {      
    name = 'Tricksy Deck',      
    text = {
        "Start run with",
        "{C:attention,T:v_magic_trick}#1#{}",
        "and {C:dark_edition,T:v_illusion}#2#,",
		"{C:attention}+1{} hand size"
    } 
  }, 
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
  loc_txt = {      
    name = 'Our Deck',      
    text = {
        "Start run with {C:attention}52{} copies",
        "of a {C:attention}random{} playing card,",
        "{C:red}X5{} base Blind size"
    } 
  }, 
	order = 16,
  unlocked = true,
  discovered = true,
	apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, card in ipairs(G.playing_cards) do
                        assert(SMODS.change_base(card, G.GAME.current_round.MLPOurDeck_card.suit, G.GAME.current_round.MLPOurDeck_card.rank))
                    end
            return true
            end
        }))
	G.GAME.starting_params.ante_scaling = 5
  end,
	pos = { x = 2, y = 0 },
	atlas = "MLPDecks"
}

local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.MLPOurDeck_card = { rank = 'Ace', suit = 'Spades' }
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	if run_start then
    local valid_ourdeck_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
            valid_ourdeck_cards[#valid_ourdeck_cards + 1] = playing_card
        end
    local ourdeck_card = pseudorandom_element(valid_ourdeck_cards, pseudoseed('lifeissogrand' .. G.GAME.round_resets.ante))
    if ourdeck_card then
        G.GAME.current_round.MLPOurDeck_card.rank = ourdeck_card.base.value
        G.GAME.current_round.MLPOurDeck_card.suit = ourdeck_card.base.suit
        G.GAME.current_round.MLPOurDeck_card.id = ourdeck_card.base.id
			end
		end
	end
end
