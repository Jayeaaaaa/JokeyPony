SMODS.Joker { -- Twilight Sparkle
	key = 'MLPTwilight',
	config = { extra = { mult = 0 } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 0, y = 0 },
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
            local temp_Mult = 1
			local temp_ID = 1
			local raised_card = nil
                          for i=1, #context.scoring_hand do
                            if temp_ID <= context.scoring_hand[i].base.id and context.scoring_hand[i].ability.effect ~= 'Stone Card' then 
							temp_ID = context.scoring_hand[i].base.nominal; raised_card = context.scoring_hand[i]
							card.ability.extra.mult = temp_ID
							end
                        end
					end
					
						if context.joker_main and card.ability.extra.mult > 0 then 
                                return {
                                    mult_mod = card.ability.extra.mult,
									message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                                }
                            
                        end
                    end
 }


SMODS.Joker { -- Rainbow Dash
	key = 'MLPRainbow',
	config = { extra = { mult = 0, mult_gain = 4 } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 0 },
	cost = 4,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.mult > 0 then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end

		    if context.end_of_round and G.GAME.current_round.hands_played == 1 and not context.repetition and context.game_over == false and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
	end
}


SMODS.Joker { -- Pinkie Pie
	key = 'MLPPinkie',
	config = { extra = { chips = 155 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 2, y = 0 },
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.joker_main and context.full_hand then
			local facecheck = 0
			for i = 1, #context.full_hand do
				if context.full_hand[i]:is_face() then
					facecheck = facecheck + 1
				end
			end
			if facecheck == 5 and card.ability.extra.chips > 0 then
				return {
				    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
					chip_mod = card.ability.extra.chips,
				}
			end
		end
	end
}


SMODS.Joker { -- Rarity
	key = 'MLPRarity',
	config = { extra = { money = 0 } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 3, y = 0 },
	cost = 4,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.money } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
            local temp_Mult = 1
			local temp_ID = 1
			local raised_card = nil
                          for i=1, #context.scoring_hand do
                            if temp_ID <= context.scoring_hand[i].base.id and context.scoring_hand[i].ability.effect ~= 'Stone Card' then 
							temp_ID = context.scoring_hand[i].base.nominal; raised_card = context.scoring_hand[i]
							card.ability.extra.money = temp_ID
							end
                        end
					end
					
						if context.joker_main and G.GAME.current_round.hands_played == 0 then 
                                return {
                                    dollars = math.ceil(card.ability.extra.money/2),
                                }
                            
                        end
                    end

			
 }
 

 SMODS.Joker {  -- Applejack
	key = 'MLPApplejack',
	config = { extra = { repetitions = 1 } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 4, y = 0 },
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			local _card = context.scoring_hand[#context.scoring_hand]
			if context.other_card == context.scoring_hand[#context.scoring_hand] or context.other_card == context.scoring_hand[#context.scoring_hand - 1] then
			return {
					message = 'Again!',
					repetitions = card.ability.extra.repetitions,
					card = card
				}
			end
		end
	end
}
 

 SMODS.Joker {  -- Fluttershy
	key = 'MLPFluttershy',
	config = { extra = { chips = 0, chips_gain = 8 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain} }
	end,
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 0 },
	cost = 4,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.chips > 0 then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
		if context.before and not context.blueprint then
		local facecheck = false
			for _, playing_card in ipairs(G.hand.cards) do
				if playing_card:is_face() then
		facecheck = true
			end
		end
	
		if not facecheck then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				card = card
			}
				end
			end
		end
}


SMODS.Joker { -- Spike
	key = 'MLPSpike',
	config = { extra = { poker_hand = "High Card" } },
	loc_vars = function(self, info_queue, card)
		return { 
			vars = { localize(card.ability.extra.poker_hand, 'poker_hands') }
			}
	end,
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 0, y = 1 },
	cost = 5,
	blueprint_compat = true,
	set_ability = function(self, card, initial, delay_sprites)
		local _poker_hands = {}
		local tarotmake = false
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("spikeywikey"))
		end,
calculate = function(self, card, context)
if context.cardarea == G.jokers and context.before then
	if context.scoring_name == card.ability.extra.poker_hand and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
							tarotmake = true
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'MLPSpike'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                                return {
                                    message = localize('k_plus_tarot'),
                                    colour = G.C.SECONDARY_SET.Tarot,
									card = card
                                }
								
                            end
						end

		if context.end_of_round  and not context.repetition and context.game_over == false and not context.blueprint then
                local _poker_hands = {}
				tarotmake = false
                for k, v in pairs(G.GAME.hands) do
                    if v.visible and k ~= card.ability.extra.poker_hand then _poker_hands[#_poker_hands+1] = k end
                    end
                    card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('spikeywikey'))
                    return {
                        message = localize('k_reset')
                    }
					
                end						

		if context.final_scoring_step and tarotmake and not context.blueprint then
                local _poker_hands = {}
				tarotmake = false
                for k, v in pairs(G.GAME.hands) do
                    if v.visible and k ~= card.ability.extra.poker_hand then _poker_hands[#_poker_hands+1] = k end
                    end
                    card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('spikeywikey'))
                    return {
                        message = localize('k_reset')
                    }
					
                end
		end
}


-- SMODS.Joker { -- Starlight Glimmer (old)
	-- key = 'MLPStarlightold',
	-- config = { extra },
	-- loc_txt = {
		-- name = 'Starlight Glimmer',
		-- text = {
            -- "All played cards count as {C:attention}#2#s{},",
			-- "rank changes every round"
		-- }
	-- },
	-- loc_vars = function(self, info_queue, card)
		-- return { 
			-- vars = {card.ability.extra, localize(G.GAME.current_round.MLPStarlight_card.rank, 'ranks')}
			-- }
	-- end,
	-- rarity = 3,
	-- atlas = 'MLPJokers',
	-- pos = { x = 1, y = 1 },
	-- cost = 8,
	-- blueprint_compat = false,
	-- }
	

		-- local cgi_ref = Card.get_id
		-- function Card:get_id()
			-- local id = cgi_ref(self)
			-- if next(SMODS.find_card('j_MLP_MLPStarlight')) then
					-- id = G.GAME.current_round.MLPStarlight_card.id
				-- end
			-- return id
		-- end
		
		-- local face_ref = Card.is_face
		-- function Card:is_face(from_boss)
			-- local id = face_ref(self)
					-- if next(SMODS.find_card('j_MLP_MLPStarlight')) then  
						-- if G.GAME.current_round.MLPStarlight_card.id == 11 or G.GAME.current_round.MLPStarlight_card.id == 12 or G.GAME.current_round.MLPStarlight_card.id == 13 then
					-- id = true
					-- else
					-- id = false
					-- end	
				-- end
					-- return id
				-- end
				
		-- local gui_vd = G.UIDEF.view_deck
		-- function G.UIDEF.view_deck(unplayed_only)
			-- override_maximized = true
			-- local ret_value = gui_vd(unplayed_only)
			-- override_maximized = false
			-- return ret_value
	-- end
	
	-- local igo = Game.init_game_object
-- function Game:init_game_object()
	-- local ret = igo(self)
	-- ret.current_round.MLPStarlight_card = { rank = 'Ace' }
	-- return ret
-- end
	
	-- function SMODS.current_mod.reset_game_globals(run_start)
	-- G.GAME.current_round.MLPStarlight_card = { rank = 'Ace' }
    -- local valid_MLPStarlight_cards = {}
    -- for k, v in ipairs(G.playing_cards) do
        -- if v.ability.effect ~= 'Stone Card' then
            -- valid_MLPStarlight_cards[#valid_MLPStarlight_cards+1] = v
        -- end
    -- end
    -- if valid_MLPStarlight_cards[1] then 
        -- local MLPStarlight_card = pseudorandom_element(valid_MLPStarlight_cards, pseudoseed('starlightglimmer'..G.GAME.round_resets.ante))
        -- G.GAME.current_round.MLPStarlight_card.rank = MLPStarlight_card.base.value
        -- G.GAME.current_round.MLPStarlight_card.id = MLPStarlight_card.base.id
    -- end
-- end


SMODS.Joker { -- Starlight Glimmer
	key = 'MLPStarlight',
	config = { extra = { xmult = 4 } },
	loc_vars = function(self, info_queue, card)
		return { 
			vars = {card.ability.extra.xmult}
			}
	end,
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 1 },
	cost = 7,
	blueprint_compat = false,
	
	calculate = function(self, card, context)
			local playedcards = {}
		local counts = {}
		local hasdupes = false
		if context.joker_main then

		for i=1, #context.scoring_hand do
		if context.scoring_hand[i].ability.effect == 'Stone Card' then
		table.insert(playedcards, 'StoneCard')
		else
			table.insert(playedcards, context.scoring_hand[i].base.id..context.scoring_hand[i].base.suit..context.scoring_hand[i].ability.effect)
			end
		end
		-- print(playedcards)

		for _, value in ipairs(playedcards) do
			counts[value] = (counts[value] or 0) + 1
				end
		for _, count in pairs(counts) do
			if count >= 3 then
				hasdupes = true
			end
			
		end

	if hasdupes then
				-- print(counts)
			-- print(hasdupes)
		return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
            colour = G.C.RED,
            Xmult_mod = card.ability.extra.xmult
          }
			end
		end
	end
}
				
			



SMODS.Joker { -- Trixie
	key = 'MLPTrixie',
	config = { extra = { cards_to_destroy = 1 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 2, y = 1 },
	cost = 6,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cards_to_destroy } }
	end,
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval then
            for i = 1, card.ability.extra.cards_to_destroy do
                local card_to_destroy, _ = pseudorandom_element(G.deck.cards, pseudoseed("greatandpowerful"))
                if card_to_destroy then
                    if i == 1 then
                        SMODS.calculate_effect({ message = "Magic!" }, card_to_destroy)
                    end
                    card_to_destroy.getting_sliced = true
                    card_to_destroy:start_dissolve()
                end
            end
			
				G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end}))
			
            G.E_MANAGER:add_event(Event({
              func = function()
                  local created_cards = {}
                  for i = 1, 1 do

                    local random_enhancement_key = SMODS.poll_enhancement({ guaranteed = true, key_append = 'trixieenhance'..i })
					local random_edition_table = poll_edition('trixieedition'..i, nil, nil, true, {'e_foil', 'e_holo', 'e_polychrome'})
				
					
					
					
                    local new_card = create_playing_card({
                          front = pseudorandom_element(G.P_CARDS, pseudoseed('triskie')),
                          center = G.P_CENTERS.c_base 
                      }, G.hand, nil, true) 

					local powerup = pseudorandom(pseudoseed('triskie'))
					if powerup > 0.5 then
					new_card:set_edition(random_edition_table, true, true)
					else
					new_card:set_ability(random_enhancement_key	, true, true)
					end
                      G.GAME.blind:debuff_card(new_card)
                      table.insert(created_cards, new_card)
                      play_sound('card1', 0.9 + i*0.05, 0.5) 
                      new_card:juice_up(0.2, 0.1)
                  end

                  G.hand:sort()
                  playing_card_joker_effects(created_cards)
                  card:juice_up(0.5, 0.2)

                  return true
				  
              end
          }))
          return nil, true

            end

			end
}


 SMODS.Joker { -- Sunset Shimmer
	key = 'MLPSunsetShimmer',
	config = { extra },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 3, y = 1 },
	cost = 6,
	blueprint_compat = false,
    calculate = function(self, card, context)
	local converted = false
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
		
		
        if context.final_scoring_step and context.main_eval and G.GAME.current_round.hands_played == 0 and not converted and not context.blueprint then
			local next_suit_nominal = nil
			
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            return true end }))
        for i=1, #context.scoring_hand do
            local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.scoring_hand[i]:flip();play_sound('card1', percent);context.scoring_hand[i]:juice_up(0.3, 0.3);return true end }))
        end
			
			for _, scored_card in ipairs(context.scoring_hand) do
local suit_order = {}
for i = #SMODS.Suit.obj_buffer, 1, -1 do
    suit_order[SMODS.Suit.obj_buffer[i]] = i
end
        local target_suit
			local current_index = suit_order[scored_card.base.suit]
		
        if current_index and current_index > 1 then
		
            target_suit = SMODS.Suit.obj_buffer[current_index - 1]
        else
            target_suit = SMODS.Suit.obj_buffer[#SMODS.Suit.obj_buffer]
        end

        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() scored_card:change_suit(target_suit);return true end }))
		
		converted = true
    end

        for i=1, #context.scoring_hand do
            local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.scoring_hand[i]:flip();play_sound('tarot2', percent, 0.6);context.scoring_hand[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.5)
                                return {
                                    message = "Transformed!",
                                    colour = G.C.CHIPS,
                                }
							end
                        end
					
	}
			


SMODS.Joker { -- Lyra and Bon Bon
	key = 'MLPLyrabon',
	config = { extra = { hand_size = 3, discards = -2 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 4, y = 1 },
	cost = 5,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.hand_size, card.ability.extra.discards } }
	end,
		add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.hand_size)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
	end,
		remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(-card.ability.extra.hand_size)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
	end
}
-- SMODS.Joker { -- Maud Pie (old)
	-- key = 'MLPMaud',
	-- loc_txt = {
		-- name = 'Maud Pie',
		-- text = {
            -- "Each {C:attention}Stone Card{} held in hand",
			-- "gives {C:mult}+#1#{} Mult and {X:mult,C:white}X#2#{} Mult",
		-- }
	-- },
	-- config = { extra = { mult = 25, xmult = 1.25 } },
	-- rarity = 2,
	-- atlas = 'MLPJokers',
	-- pos = { x = 5, y = 1 },
	-- cost = 6,
	-- blueprint_compat = true,
	-- loc_vars = function(self, info_queue, card)
		-- return { vars = { card.ability.extra.mult, card.ability.extra.xmult } }
	-- end,
    -- calculate = function(self, card, context)
	-- if context.cardarea == G.hand and context.individual and not context.end_of_round and SMODS.has_enhancement(context.other_card, "m_stone") then
                            -- return {
								-- mult = card.ability.extra.mult,
								-- message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
								-- x_mult = card.ability.extra.xmult,
								-- colour = G.C.RED,
								-- card = card
                            -- }
                        -- end
                    -- end
					-- }
		

SMODS.Joker { -- Maud Pie		
	key = 'MLPMaud', 
	config = { extra = { xmult = 1.5 } },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 1 },
	cost = 6,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
    calculate = function(self, card, context)
	if context.cardarea == G.hand and context.individual and not context.end_of_round and SMODS.has_enhancement(context.other_card, "m_stone") then
		if context.other_card.debuff then
            return {
                message = localize('k_debuffed'),
                colour = G.C.RED,
                card = card
                }
            else
            return {
				x_mult = card.ability.extra.xmult,
				colour = G.C.RED,
				card = card
                }
						end
                    end
                end,
		    in_pool = function(self, args)
        for _, playing_card in pairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end
}


 SMODS.Joker { -- Apple Bloom
	key = 'MLPAppleBloom',
	config = { extra = { xmult = 1.5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 0, y = 2 },
	cost = 6,
	blueprint_compat = true,
	calculate = function(self, card, context)
		 if context.individual and context.cardarea == G.play then
			if #context.scoring_hand > 1 and context.scoring_hand[#context.scoring_hand]:get_id() == context.scoring_hand[#context.scoring_hand - 1]:get_id() then
				if context.other_card == context.scoring_hand[#context.scoring_hand] or context.other_card == context.scoring_hand[#context.scoring_hand - 1] then
			return {
                    xmult = card.ability.extra.xmult
				}
			end
		end	
	end
end
}


SMODS.Joker { -- Sweetie Belle
	key = 'MLPSweetieBelle',
	config = { extra = { chips = 0, chips_gain = 0 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 2 },
	cost = 6,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
	end,
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
            local temp_Chips = 1
			local temp_ID = 1
			local raised_card = nil
                          for i=1, #context.scoring_hand do
                            if temp_ID <= context.scoring_hand[i].base.id and context.scoring_hand[i].ability.effect ~= 'Stone Card' then 
							temp_ID = context.scoring_hand[i].base.nominal; raised_card = context.scoring_hand[i]
							card.ability.extra.chips_gain = temp_ID
							card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
						return {
							message = 'Upgraded!',
							colour = G.C.CHIPS,
							card = card
							}
							end
                        end
					end
					
		if context.joker_main and card.ability.extra.chips > 0 then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
			end
		end
 }
 
             -- "This Joker gains {C:attention}half{} of the {C:attention}highest{}",
			-- "ranked card in played hand",
			-- "as {C:chips}Chips{} when a hand is played",
			-- "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"			
 

 SMODS.Joker {  -- Scootaloo
    key = "MLPScootaloo",
    blueprint_compat = false,
    rarity = 2,
	atlas = 'MLPJokers',
    cost = 6,
    pos = { x = 2, y = 2 },
    config = { extra = { dollars = 1, dollars_gain = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.dollars_gain } }
    end,
	calculate = function(self, card, context)
		    if context.end_of_round and G.GAME.current_round.hands_played == 1 and not context.repetition and context.game_over == false and not context.blueprint then
			card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_gain
			return {
				message = localize('k_val_up'),
				colour = G.C.MONEY,
				card = card
			}
		end
	end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
	end
}


 SMODS.Joker { -- Big McIntosh
	key = 'MLPBigMac',
	config = { extra = { retriggers = 2, odds = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.retriggers, card.ability.extra.odds, G.GAME.probabilities.normal } }
	end,
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 3, y = 2 },
	cost = 5,
	blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if pseudorandom(pseudoseed('eeyup')) < G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					message = 'Eeyup!',
					repetitions = card.ability.extra.retriggers,
					-- The card the repetitions are applying to is context.other_card
					card = card
				}
			end
		end
	end
}


 SMODS.Joker { -- Zecora
	key = 'MLPZecora',
	config = { extra = { odds = 4 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.odds, G.GAME.probabilities.normal } }
	end,
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 0, y = 3 },
	cost = 4,
	blueprint_compat = true,
    calculate = function(self, card, context)
	if context.before and context.main_eval and not context.blueprint and #context.full_hand == 4 then
			if pseudorandom(pseudoseed('potionbrewing')) < G.GAME.probabilities.normal / card.ability.extra.odds and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'MLPZecora'
							}
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                                return {
                                    message = localize('k_plus_tarot'),
                                    colour = G.C.SECONDARY_SET.Tarot,
                                }
			end
		end
	end
}


 SMODS.Joker { -- Derpy
	key = 'MLPDerpy',
	config = { extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 3 },
	cost = 4,
	blueprint_compat = true,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then 
			if SMODS.get_enhancements(context.other_card)["m_lucky"] == true and context.other_card.lucky_trigger then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
				end
			end
		end,
		    in_pool = function(self, args)
        for _, playing_card in pairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end
	}
	

 SMODS.Joker { -- DJ PON-3
	key = 'MLPDJPON3',
	config = { extra = { chips = 80 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.chips, G.GAME.current_round.MLPMUSIC_card.rank}}
	end,
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 4 },
	cost = 6,
	blueprint_compat = true,
	-- set_ability = function(self, card, initial, delay_sprites)
		-- G.GAME.current_round.MLPMUSIC_card.id = (pseudorandom("wubs", 1, 14))
	-- if G.GAME.current_round.MLPMUSIC_card.id == 14 then G.GAME.current_round.MLPMUSIC_card.rank = 'Ace'
	-- elseif G.GAME.current_round.MLPMUSIC_card.id == 13 then G.GAME.current_round.MLPMUSIC_card.rank = 'King'
	-- elseif G.GAME.current_round.MLPMUSIC_card.id == 12 then G.GAME.current_round.MLPMUSIC_card.rank = 'Queen'
	-- elseif G.GAME.current_round.MLPMUSIC_card.id == 11 then G.GAME.current_round.MLPMUSIC_card.rank = 'Jack'
	-- else G.GAME.current_round.MLPMUSIC_card.rank = G.GAME.current_round.MLPMUSIC_card.id
		-- end
	-- end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == G.GAME.current_round.MLPMUSIC_card.id then
                return {
					chips = card.ability.extra.chips,
					card = card
					}
            end
		end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss then
			return {
				message = 'Next Track!',
				colour = G.C.CHIPS,
				card = card
			}
			end
        end
    end,
}

 SMODS.Joker { -- Octavia Melody
	key = 'MLPOctavia',
	config = { extra = { mult = 10 } },
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.mult, G.GAME.current_round.MLPMUSIC_card.rank}}
	end,
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 2, y = 4 },
	cost = 6,
	blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == G.GAME.current_round.MLPMUSIC_card.id then
                return {
					mult = card.ability.extra.mult,
					card = card
				   }
				end
            end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.blind.boss then
			return {
				message = 'Next Piece!',
				colour = G.C.MULT,
				card = card
			}
			end
        end
    end,
}

-- Functions for DJ PON-3 and Octavia
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.MLPMUSIC_card = { id = 14, rank = 'Ace' }
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	if run_start then
		G.GAME.current_round.MLPMUSIC_card.id = (pseudorandom("musicmares", 2, 14))
	if G.GAME.current_round.MLPMUSIC_card.id == 14 then G.GAME.current_round.MLPMUSIC_card.rank = 'Ace'
	elseif G.GAME.current_round.MLPMUSIC_card.id == 13 then G.GAME.current_round.MLPMUSIC_card.rank = 'King'
	elseif G.GAME.current_round.MLPMUSIC_card.id == 12 then G.GAME.current_round.MLPMUSIC_card.rank = 'Queen'
	elseif G.GAME.current_round.MLPMUSIC_card.id == 11 then G.GAME.current_round.MLPMUSIC_card.rank = 'Jack'
	else G.GAME.current_round.MLPMUSIC_card.rank = G.GAME.current_round.MLPMUSIC_card.id
		end		
	end
end

local SMODS_calculate_context_ref1 = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
	if context.end_of_round then
		if G.GAME.blind.boss then
	if G.GAME.current_round.MLPMUSIC_card.id == 14 then 
		G.GAME.current_round.MLPMUSIC_card.id = 2
		else
		G.GAME.current_round.MLPMUSIC_card.id = (G.GAME.current_round.MLPMUSIC_card.id or 0)+1
		
	end
	if G.GAME.current_round.MLPMUSIC_card.id == 14 then G.GAME.current_round.MLPMUSIC_card.rank = 'Ace'
	elseif G.GAME.current_round.MLPMUSIC_card.id == 13 then G.GAME.current_round.MLPMUSIC_card.rank = 'King'
	elseif G.GAME.current_round.MLPMUSIC_card.id == 12 then G.GAME.current_round.MLPMUSIC_card.rank = 'Queen'
	elseif G.GAME.current_round.MLPMUSIC_card.id == 11 then G.GAME.current_round.MLPMUSIC_card.rank = 'Jack'
	else G.GAME.current_round.MLPMUSIC_card.rank = G.GAME.current_round.MLPMUSIC_card.id
			end
		end
	end
    return SMODS_calculate_context_ref1(context, return_table)
end


SMODS.Joker { -- Discord
	key = 'MLPDiscord',
	config = { extra = { xmult = 1, poker_hand = "High Card", xmultmax = 50, xmultmin = 10 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 0, y = 4 },
	cost = 6,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, localize(card.ability.extra.poker_hand, 'poker_hands'),  } }
	end,
	set_ability = function(self, card, initial, delay_sprites)
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("whatfunisthereinmakingsense"))
		card.ability.extra.xmult = (pseudorandom("cozydraconequus", card.ability.extra.xmultmin, card.ability.extra.xmultmax)/10)
		end,
    calculate = function(self, card, context)
        if context.discard or context.final_scoring_step and not context.blueprint then
			local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("whatfunisthereinmakingsense"))
		card.ability.extra.xmult = (pseudorandom("cozydraconequus", card.ability.extra.xmultmin, card.ability.extra.xmultmax)/10)
                    -- return {
                        -- message = "Snap!"
                    -- }
					
                end


      if context.joker_main then
        if context.scoring_name == card.ability.extra.poker_hand then
          return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
            colour = G.C.RED,
            Xmult_mod = card.ability.extra.xmult
          }
        end
      end
    end
  }


SMODS.Joker { -- Elements of Harmony
	key = 'MLPElements',
	config = { extra = { xmult = 6, jokers = 6 } },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 4, y = 2 },
	cost = 6,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.jokers,  } }
	end,
    calculate = function(self, card, context)
      if context.joker_main then
        if #G.jokers.cards >= card.ability.extra.jokers then
          return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
            colour = G.C.RED,
            Xmult_mod = card.ability.extra.xmult
          }
        end
      end
    end
  }
 

SMODS.Joker { -- Crystal Heart
	key = 'MLPCrystalHeart',
	config = { extra = { chips = 30 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 4, y = 3 },
	cost = 6,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
	end,
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.hand and not context.end_of_round then
		if context.other_card:is_suit('Hearts') or context.other_card:is_suit('Diamonds') then
                        if context.other_card.debuff then
                            return {
                                message = localize('k_debuffed'),
                                colour = G.C.RED,
                                card = card,
                            }
                        else
				return {
					chips = card.ability.extra.chips,
					card = card
				}
			end
        end
      end
	end
  }
 

 SMODS.Joker {  -- Sonic Rainboom
	key = 'MLPSonicRainboom',
	config = { extra = { xmult = 1, xmult_gain = 0.5 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 2 },
	cost = 6,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain,  } }
	end,
    calculate = function(self, card, context)	
         if context.skip_blind and not context.blueprint then
		                 G.E_MANAGER:add_event(Event({
                    func = function() 
                        card_eval_status_text(card, 'extra', nil, nil, nil, {
                            message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}},
                                colour = G.C.RED,
                            card = card
                        }) 
						return true
						end}))
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
		end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if not G.GAME.blind.boss and card.ability.extra.xmult > 1 then
                card.ability.extra.xmult = 1
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
	end
end
}


 SMODS.Joker {  -- Nap Time
	key = 'MLPNapTime',
	config = { extra = { mult = 0, mult_gain = 2 } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 3 },
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain} }
	end,
    calculate = function(self, card, context)	
			if context.before and not context.blueprint then
				local allscored = false			
					if #context.full_hand == #context.scoring_hand then
						allscored = true
						end 
				if allscored then
				local last_mult = card.ability.extra.mult
                            card.ability.extra.mult = 0
                            if last_mult > 0 then 
                                return {
                                    card = card,
                                    message = localize('k_reset')
                                }
							end
						else
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
--[[ 						return {
							message = 'Upgraded!',
							colour = G.C.Mult,
							card = card
							} ]]
							end
                        end
		if context.joker_main and card.ability.extra.mult > 0 then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
			end
		end
 }
 

 SMODS.Joker {  -- Dragon Code
	key = 'MLPDragonCode',
	config = { extra = { tarotmake = false } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 3, y = 3 },
	cost = 5,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.tarotmake } }
	end,
    calculate = function(self, card, context)	

        if context.using_consumeable and context.consumeable.ability.set == "Tarot" and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit and not card.ability.extra.tarotmake then
			card.ability.extra.tarotmake = true
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key_append = 'MLPDragonCode'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                                return {
                                    message = localize('k_plus_tarot'),
                                    colour = G.C.SECONDARY_SET.Tarot,
									card = card
                                }
							end
		if context.end_of_round and card.ability.extra.tarotmake and not context.blueprint then
			card.ability.extra.tarotmake = false
                    return {
                        message = localize('k_reset')
                    }			
					end
				end
 }


 SMODS.Joker {  -- Library Card
	key = 'MLPLibraryCard',
	config = { extra = { mult = 0, mult_gain = 1, lasthandtype = 'None' } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 3, y = 4 },
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.lasthandtype } }
	end,
    calculate = function(self, card, context)	
			if context.before and not context.blueprint then
				local chain = nil
				if card.ability.extra.lasthandtype ~= context.scoring_name then 
				card.ability.extra.lasthandtype = context.scoring_name
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
					chain = true
--[[ 						return {
							message = 'Upgraded!',
							colour = G.C.Mult,
							card = card
							} ]]
				end
				if context.scoring_name == card.ability.extra.lasthandtype and not chain then 
				local last_mult = card.ability.extra.mult
                            card.ability.extra.mult = 0
                            if last_mult > 0 then 
                                return {
                                    card = card,
                                    message = localize('k_reset')
                                }
							end
						end
					end
		if context.joker_main and card.ability.extra.mult > 0 then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
			end
		end
 }
 
 SMODS.Joker { -- Mural of Competition (L)
	key = 'MLPMuralCompetition',
	loc_txt = {
	},
	config = { extra = { repetitions = 1 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 3, y = 5 },
	soul_pos = { x = 3, y = 6 },	
	cost = 8,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if (
                context.other_card:get_id() == 6 or 
                context.other_card:get_id() == 7 or 
                context.other_card:get_id() == 8 or 
                context.other_card:get_id() == 9 or 
                context.other_card:get_id() == 10) then
				return {
					message = 'Again!',
					repetitions = card.ability.extra.repetitions,
					card = card
				}
			end
		end
	end
}

 SMODS.Joker { -- Mural of Friendship (C)
	key = 'MLPMuralFriendship',
	config = { extra = { xmult_gain = 0.1, xmult = 1 } },
	rarity = 4,
	atlas = 'MLPJokers',
	pos = { x = 4, y = 5 },
	soul_pos = { x = 4, y = 6 },
	cost = 20,
	loc_vars = function(self, info_queue, card)
	return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
	end,
	calculate = function(self, card, context)
	
	        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
		
		if context.cardarea == G.play and context.individual and not context.blueprint then
			if (
                context.other_card:get_id() == 6 or 
                context.other_card:get_id() == 7 or 
                context.other_card:get_id() == 8 or 
                context.other_card:get_id() == 9 or 
                context.other_card:get_id() == 10) then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
			return {
				extra = { focus = card, message = localize("k_upgrade_ex") },
				card = card,
				colour = G.C.MULT,
				}
			end
		end
	end
}

 SMODS.Joker { -- Mural of Compassion (R)
	key = 'MLPMuralCompassion',
	config = { extra = { dollars = 1 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 5 },
	soul_pos = { x = 5, y = 6 },	
	cost = 8,
	loc_vars = function(self, info_queue, card)
	return { vars = { card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.individual then
			if (
                context.other_card:get_id() == 6 or 
                context.other_card:get_id() == 7 or 
                context.other_card:get_id() == 8 or 
                context.other_card:get_id() == 9 or 
                context.other_card:get_id() == 10) then
			G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    dollars = card.ability.extra.dollars,
                    card = card
                    }
                end
		end
	end
}

SMODS.Joker { -- Sunburst
	key = 'MLPSunburst',
	config = { extra },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 2, y = 3 },
	cost = 7,
	blueprint_compat = true,
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
		if context.other_card.seal == 'Blue' or context.other_card.seal == 'Purple' then 
			local powerup = pseudorandom(pseudoseed('verypowerfulwizard'))
			local consumeabletype = nil
					if powerup < 0.02 then consumeabletype = 'Spectral'
					elseif powerup > 0.65 then consumeabletype = 'Planet'
					else consumeabletype = 'Tarot'
					end
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                    extra = {
                        message = "Conjured!",
                        message_card = card,
                        func = function() -- This is for timing purposes, everything here runs after the message
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = consumeabletype,
                                        key_append = 'MLPSunburst' -- Optional, useful for checking the source of the creation in `in_pool`.
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end)
                            }))
                        end
                    },
                }
			end
			end
            end,
    in_pool = function(self, args)
        local seal_count = 0
    if G.GAME and G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.seal == 'Blue' or card.seal == 'Purple' then
                seal_count = seal_count + 1
            end
        end
    end
    if seal_count > 0 then
        return true
	else
        return false
	end
    end
}

SMODS.Joker { -- Gilda
	key = 'MLPGilda',
    config = { extra = { mult = 0, mult_mod = 1, money_req = 5, money_spent = 0, money_mod = 5 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 5 },
	cost = 6,
	blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod, card.ability.extra.money_req, card.ability.extra.money_spent, card.ability.extra.money_mod}}
    end,
    calculate = function(self, card, context)
	if context.MLP_ease_dollars and to_big(context.MLP_ease_dollars) < to_big(0) and not context.blueprint then
			card.ability.extra.money_spent =
				lenient_bignum(to_big(card.ability.extra.money_spent) - context.MLP_ease_dollars)
					card.ability.extra.mult = math.floor(card.ability.extra.money_spent / card.ability.extra.money_req)
					                return {
                    delay = 0.5,
                    message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                    colour = G.C.RED
                }
        elseif context.cardarea == G.jokers and context.joker_main then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                mult_mod = card.ability.extra.mult
            }
        end
	end
}


local ed = ease_dollars
function ease_dollars(mod, x)
    ed(mod, x)
SMODS.calculate_context{MLP_ease_dollars = to_big(mod)}
end

--[[ SMODS.Joker { -- Queen Chrysalis
	key = 'MLPChrysalis',
	loc_txt = {
		name = 'Queen Chrysalis',
		text = {
            "When a {C:attention}Blind{} is selected, this Joker",
			"removes the {C:attention}enhancement{} of {C:attention}#3#{} random card",
			"in your {C:attention}full deck{} and gains {X:mult,C:white}X#2#{} Mult",
			"{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
		}
	},
	config = { extra = { xmult = 1, xmult_gain = 0.25, cards_to_destroy = 1 } },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 6 },
	cost = 9,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain, card.ability.extra.cards_to_destroy } }
	end,
    calculate = function(self, card, context)
 		if context.setting_blind and context.main_eval then
			local enhancedcards = {}
		        for _, playing_card in ipairs(G.deck.cards or {}) do
            if not SMODS.has_enhancement(playing_card, 'c_base') then
                table.insert(enhancedcards, playing_card)
				end
            end
            for i = 1, card.ability.extra.cards_to_destroy do
                local card_to_destroy, _ = pseudorandom_element(enhancedcards, pseudoseed("thisdayhasbeenjustperfect"))
        	if card_to_destroy and #enhancedcards > 1 then
                    if i == 1 then
                        SMODS.calculate_effect({ message = "Drained!" }, card_to_destroy)
			end
		card_to_destroy:set_ability('c_base', nil, true)
		card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
				end	
			end
		end
	    if context.joker_main then
        return {
            xmult = card.ability.extra.xmult
        }
		end
    end
} ]]