

-- Equestrian Deck
SMODS.Back{
  name = "Equestrian Deck",
	key = "MLPEquestriaDeck",  
	order = 16,
  unlocked = true,
  discovered = true,
	config = {vouchers = {"v_overstock_norm"}},
  loc_vars = function(self, info_queue, center)
    return {vars = {localize{type = 'name_text', key = 'v_overstock_norm', set = 'Voucher'}}}
	end,
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

 SMODS.Back{ -- Miraculous Deck
    name = "Miraculous Deck",
	key = "MLPMiraculousDeck",  
	order = 16,
  unlocked = true,
  discovered = true,
	apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, 6 do              
			local basecards = {}
		        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'c_base') then
                table.insert(basecards, playing_card)
				end
            end
                      local random_enhancement_key = SMODS.poll_enhancement({ guaranteed = true, key_append = 'miracleenhance'..i })
                      local random_seal_key = SMODS.poll_seal({ guaranteed = true, key_append = 'miracleseal'..i })                  
            					local random_edition_table = poll_edition('miracleedition'..i, nil, nil, true)
					if not (SMODS.Mods['Cryptid']  or {}).can_load  then
						if random_edition_table == 'e_negative' then
							random_edition_table = 'e_foil'
							-- print('replacednegative')
						end
					end                      
              local miracledeck_card = pseudorandom_element(basecards, pseudoseed('miraclecard' .. G.GAME.round_resets.ante))
                      miracledeck_card:set_ability(random_enhancement_key, true)
                      miracledeck_card:set_seal(random_seal_key, true)
                      miracledeck_card:set_edition(random_edition_table, true)
                      -- print('applied')            
        end
            return true            
          end
        }))
  end,
	pos = { x = 3, y = 0 },
	atlas = "MLPDecks"
}