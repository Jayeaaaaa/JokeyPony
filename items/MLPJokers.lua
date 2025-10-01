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
                            if temp_ID <= context.scoring_hand[i].base.id and not SMODS.has_no_rank(context.scoring_hand[i]) then 
							temp_Mult = context.scoring_hand[i].base.nominal		
							temp_ID = context.scoring_hand[i].base.id
							card.ability.extra.mult = temp_Mult
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
    perishable_compat = false,	
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
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				card = card
			}
		end
	end
}


SMODS.Joker { -- Pinkie Pie
	key = 'MLPPinkie',
	config = { extra = { chips = 120 } },
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
                            if temp_ID <= context.scoring_hand[i].base.id and not SMODS.has_no_rank(context.scoring_hand[i]) then 
							temp_Mult = context.scoring_hand[i].base.nominal		
							temp_ID = context.scoring_hand[i].base.id
							card.ability.extra.money = temp_Mult
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
					message = localize('k_again_ex'),
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
	perishable_compat = false,		
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
				message = localize('k_upgrade_ex'),
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
		if SMODS.has_no_suit(context.scoring_hand[i]) then
			table.insert(playedcards, context.scoring_hand[i].ability.name)
		elseif SMODS.has_no_rank(context.scoring_hand[i]) then
			table.insert(playedcards, context.scoring_hand[i].base.suit..context.scoring_hand[i].ability.name)
		elseif SMODS.has_any_suit(context.scoring_hand[i]) then
			table.insert(playedcards, context.scoring_hand[i].base.id..context.scoring_hand[i].ability.name)
		else
			table.insert(playedcards, context.scoring_hand[i].base.id..context.scoring_hand[i].base.suit..context.scoring_hand[i].ability.name)
			end
			-- print(playedcards)
		end
		for _, value in ipairs(playedcards) do
			counts[value] = (counts[value] or 0) + 1
				end
		for _, count in pairs(counts) do
			if count >= 3 then
				hasdupes = true
			end	
		end

	if hasdupes then
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
                        SMODS.calculate_effect({ message = localize('k_MLPmagic') }, card_to_destroy)
                    end
                    SMODS.destroy_cards(card_to_destroy)
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
					local random_edition_table = poll_edition('trixieedition'..i, nil, nil, true)
					if not (SMODS.Mods['Cryptid']  or {}).can_load  then
						if random_edition_table == 'e_negative' then
							random_edition_table = 'e_foil'
							-- print('replacednegative')
						end
					end
					
					
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
                                    message = localize('k_MLPtransformed'),
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

SMODS.Joker { -- Maud Pie		
	key = 'MLPMaud', 
	config = { extra = { xmult = 1.5 } },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 1 },
	cost = 6,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone		
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
	perishable_compat = false,		
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
	end,
	calculate = function(self, card, context)
		if context.before and not context.blueprint and G.GAME.current_round.hands_played == 0 then
            local temp_Chips = 1
			local temp_ID = 1
			local raised_card = nil
                          for i=1, #context.scoring_hand do
                            if temp_ID <= context.scoring_hand[i].base.id and not SMODS.has_no_rank(context.scoring_hand[i]) then 
							temp_Chips = context.scoring_hand[i].base.nominal
							temp_ID = context.scoring_hand[i].base.id
							card.ability.extra.chips_gain = temp_Chips
							card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
						return {
							message = localize('k_upgrade_ex'),
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

SMODS.Joker {  -- Scootaloo
	key = "MLPScootaloo",
    blueprint_compat = false,
    rarity = 2,
	atlas = 'MLPJokers',
    cost = 6,
    pos = { x = 2, y = 2 },
	perishable_compat = false,	
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
					message = localize('k_MLPeeyup'),
					repetitions = card.ability.extra.retriggers,
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
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky		
		return { vars = { card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 3 },
	cost = 4,
	blueprint_compat = true,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then 
			if SMODS.has_enhancement(context.other_card, "m_lucky") and context.other_card.lucky_trigger then
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


--[[ SMODS.Joker { -- Derpy
	key = 'MLPDerpy',
	config = { extra = { repetitions = 1 } },
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky		
		return { vars = { card.ability.extra.repetitions } }
	end,
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 3 },
	cost = 4,
	blueprint_compat = true,
    calculate = function(self, card, context)
	local ret1 = { message = localize('k_again_ex'), repetitions = 1, card = card }				
	local effects = {}			
        if context.individual and context.cardarea == G.play then 
			if SMODS.has_enhancement(context.other_card, "m_lucky") and context.other_card.lucky_trigger then
    			table.insert(effects, ret1)		
				end
			end

		if context.repetition and context.cardarea == G.play then
			return SMODS.merge_effects(effects)						
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
 ]]

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
				message = localize('k_MLPnexttrack'),
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
				message = localize('k_MLPnextpiece'),
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
		card.ability.extra.xmult = (pseudorandom("klutzydraconequus", card.ability.extra.xmultmin, card.ability.extra.xmultmax)/10)
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
		card.ability.extra.xmult = (pseudorandom("klutzydraconequus", card.ability.extra.xmultmin, card.ability.extra.xmultmax)/10)
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
        if #G.jokers.cards > card.ability.extra.jokers then
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
	perishable_compat = false,	
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
	perishable_compat = false,	
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
	perishable_compat = false,	
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
	cost = 6,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if (
                context.other_card:get_id() == 6 or 
                context.other_card:get_id() == 7 or 
                context.other_card:get_id() == 8 or 
                context.other_card:get_id() == 9 or 
                context.other_card:get_id() == 10) then
				return {
					message = localize('k_again_ex'),
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
	blueprint_compat = true,
	perishable_compat = false,	
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
	config = { extra = { dollars = 2 } },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 5 },
	soul_pos = { x = 5, y = 6 },	
	cost = 8,
	blueprint_compat = true,
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
                        message = localize('k_MLPconjured'),
                        message_card = card,
                        func = function() 
                            G.E_MANAGER:add_event(Event({
                                func = (function()
                                    SMODS.add_card {
                                        set = consumeabletype,
                                        key_append = 'MLPSunburst' 
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
    config = { extra = { mult = 0, mult_mod = 1, money_req = 5, money_spent = 0 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 1, y = 5 },
	cost = 6,
	blueprint_compat = true,
	perishable_compat = false,	
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod, card.ability.extra.money_req, card.ability.extra.money_spent}}
    end,
    calculate = function(self, card, context)
	to_big = to_big or function(a) return a end
	if context.MLP_ease_dollars and to_big(context.MLP_ease_dollars) < to_big(0) and not context.blueprint then
			card.ability.extra.money_spent =
				to_big(card.ability.extra.money_spent) - context.MLP_ease_dollars
					card.ability.extra.mult = math.floor((card.ability.extra.money_spent / 5)*card.ability.extra.mult_mod)
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

-- Function for Gilda
to_big = to_big or function(a) return a end
local ed = ease_dollars
function ease_dollars(mod, x)
    ed(mod, x)
SMODS.calculate_context{MLP_ease_dollars = to_big(mod)}
end

SMODS.Joker { -- Gabby
	key = 'MLPGabby',
	loc_txt = {
	},
	config = { extra = { chips = 0, chips_gain = 2 } },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 3, y = 0 },	
	cost = 6,
	perishable_compat = false,	
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
	end,
	calculate = function(self, card, context)
		if context.post_trigger and context.other_card ~= card and context.other_ret.jokers then 
			if (
			context.other_ret.jokers.chips or
			context.other_ret.jokers.mult or
			context.other_ret.jokers.h_chips or
			context.other_ret.jokers.h_mult or			
			context.other_ret.jokers.chip_mod or
			context.other_ret.jokers.mult_mod
		) then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
			return {
				focus = card, 
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS,
				card = card
			}
					end
				end

		if context.joker_main and card.ability.extra.chips > 0 then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
				card = card
			}
			end			
		end
}

SMODS.Joker { -- Cheerilee
	key = 'MLPCheerilee',
	config = { extra = { chipmult = 0 } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 0, y = 5 },	
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chipmult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card then
			if (
                context.other_card:get_id() == 2 or 
                context.other_card:get_id() == 3 or 
                context.other_card:get_id() == 4 or 
                context.other_card:get_id() == 5) then
 				card.ability.extra.chipmult = context.other_card:get_id()
--[[					local chipormult = pseudorandom(pseudoseed('itstimeforclass'))
					if chipormult > 0.5 then ]]
			            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.chipmult}},
                mult_mod = card.ability.extra.chipmult
            }					
--[[ 				else
				            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chipmult}},
                chip_mod = (card.ability.extra.chipmult * 10)
            }				
			end ]]
		end
	end
end
}

SMODS.Joker { -- Flower Girls
    key = "MLPFlowerGirls",
	rarity = 1,
	atlas = 'MLPJokers2',
	pos = { x = 4, y = 0 },	
	cost = 5,
	blueprint_compat = true,
	perishable_compat = false,	
    config = { extra = {mult = 0, mult_gain = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local suits = {
                ['Hearts'] = 0,
                ['Diamonds'] = 0,
                ['Spades'] = 0,
                ['Clubs'] = 0
            }
            for i = 1, #context.scoring_hand do
                if not SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Hearts', true) and suits["Hearts"] == 0 then
                        suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0 then
                        suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0 then
                        suits["Spades"] = suits["Spades"] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0 then
                        suits["Clubs"] = suits["Clubs"] + 1
                    end
                end
            end
            for i = 1, #context.scoring_hand do
                if SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then
                        suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0 then
                        suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0 then
                        suits["Spades"] = suits["Spades"] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0 then
                        suits["Clubs"] = suits["Clubs"] + 1
                    end
                end
            end
            if suits["Hearts"] > 0 and
                suits["Diamonds"] > 0 and
                suits["Spades"] > 0 and
                suits["Clubs"] > 0 then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
				return {
					message = localize('k_upgrade_ex'),
					colour = G.C.MULT,
					card = card
				}
				end
            end
		if context.joker_main and card.ability.extra.mult > 0 then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
			end
    end,
}

SMODS.Joker { -- Spitfire
    key = "MLPSpitfire",
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 5, y = 0 },	
	cost = 6,
	blueprint_compat = true,
    config = { extra = { mult = 2, odds = 3} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.odds, G.GAME.probabilities.normal } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
			if pseudorandom(pseudoseed('academyrecord')) < G.GAME.probabilities.normal / card.ability.extra.odds then			
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                card.ability.extra.mult
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.Mult
            }
        	end
    	end
	end
}

SMODS.Joker { -- Dr. Hooves
    key = "MLPDrHooves",
	rarity = 1,
	atlas = 'MLPJokers2',
	pos = { x = (math.random(0, 2)), y = 5 },	
	cost = 5,
	blueprint_compat = true,
    config = { extra = { mult = 7, chips = 49} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
		if context.joker_main and G.GAME.round_resets.ante > 0 then
			            return {
                mult = card.ability.extra.mult*(G.GAME.round_resets.ante - 1)
            }
		end
	end
}

SMODS.Joker {  -- Daring Do
	key = 'MLPDaringDo',
	config = { extra = { xmult = 0.5,} },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 5, y = 3 },
	cost = 7,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult  } }
	end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.discards_used == 0 then
            return {
                xmult = 1 + (G.GAME.current_round.discards_left * card.ability.extra.xmult)
            }
        end
    end
}

--[[ SMODS.Joker { -- The Cakes
    key = "MLPTheCakes",
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 1, y = 1 },	
	cost = 6,
	blueprint_compat = false,
    config = { extra = { extracards = 1, discardno = nil,} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.extracards, card.ability.extra.discardno } }
    end,
    calculate = function(self, card, context)
		if context.setting_blind then
			card.ability.extra.discardno = nil
		end
		if context.discard then
			card.ability.extra.discardno = #context.full_hand
		end
            if context.drawing_cards and card.ability.extra.discardno then
                return {
                    cards_to_draw = (card.ability.extra.discardno) + card.ability.extra.extracards
                }
		end
	end
} ]]

--[[ SMODS.Joker{ -- Party Cannon
	key = 'MLPPartyCannon',
	config = { extra = { mult = 0, mult_gain = 2, poker_hand = "High Card" } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 4 },
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, localize(card.ability.extra.poker_hand, 'poker_hands')} }
	end,
		set_ability = function(self, card, initial, delay_sprites)
		local _poker_hands = {}
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('letsgetthispartystarted'))
		end,
    calculate = function(self, card, context)					
			if context.before and not context.blueprint then
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                        end

		if context.final_scoring_step and not context.blueprint then 
				    local _poker_hands = {}		
				for k, v in pairs(G.GAME.hands) do
                    if v.visible and k ~= card.ability.extra.poker_hand then _poker_hands[#_poker_hands+1] = k end
                    end
                        if context.scoring_name == card.ability.extra.poker_hand then
                                return {
                                    card = card,
                                    message = localize('k_reset')
                                }
							end				
                    card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('letsgetthispartystarted'))
                end		

		if context.joker_main and card.ability.extra.mult > 0 then
	if context.scoring_name == card.ability.extra.poker_hand then
			local accumulate = card.ability.extra.mult
			card.ability.extra.mult = 0
			        return {
					mult_mod = accumulate,
					message = localize { type = 'variable', key = 'a_mult', vars = { accumulate } },
						}				
			end
		end
	end
} ]]

SMODS.Joker{ -- Party Cannon
	key = 'MLPPartyCannon',
	config = { extra = { mult = 0, mult_gain = 2, poker_hand = "High Card" } },
	rarity = 1,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 4 },
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, localize(card.ability.extra.poker_hand, 'poker_hands')} }
	end,
    calculate = function(self, card, context)
        if context.final_scoring_step and not context.blueprint then
            local reset = true
            local play_more_than = (G.GAME.hands[context.scoring_name].played or 0)
            for handname, values in pairs(G.GAME.hands) do
                if handname ~= context.scoring_name and values.played >= play_more_than and SMODS.is_poker_hand_visible(handname) then
                    reset = false
                    break
                end
            end
            if not reset then
			local accumulate = card.ability.extra.mult
			card.ability.extra.mult = 0
			        return {
					mult_mod = accumulate,
					message = localize { type = 'variable', key = 'a_mult', vars = { accumulate } },
						}		
            else
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            end
        end
    end,
}

SMODS.Joker{ -- Friendship Lesson
	key = 'MLPFriendshipLesson',
	config = { extra = { poker_hand = "High Card", learned = false } },
	loc_vars = function(self, info_queue, card)
		return { 
			vars = { localize(card.ability.extra.poker_hand, 'poker_hands'), card.ability.extra.learned }
			}
	end,
    pos = {
        x = 4,
        y = 4
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    atlas = 'MLPJokers',
	set_ability = function(self, card, initial, delay_sprites)
		local _poker_hands = {}
		local planetmake = false
		local learned = false
		card.ability.extra.learned = false
		for k, v in pairs(G.GAME.hands) do
			if v.visible then
				_poker_hands[#_poker_hands + 1] = k
			end
		end
		card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("fiduciacompellus"))
		end,
    calculate = function(self, card, context)
	if context.before and context.scoring_name == card.ability.extra.poker_hand then
		if not planetmake then
			learned = true
			card.ability.extra.learned = true
                    local _handname, _played, _order = 'High Card', -1, 100
                    for k, v in pairs(G.GAME.hands) do
                        if v.played > _played or (v.played == _played and _order > v.order) then 
                            _played = v.played
                            _handname = k
                        end
                    end										
					return {
						level_up = 1,
						level_up_hand = _handname,
						message = localize('k_level_up_ex')
					}					
						end
				end
		
		if context.final_scoring_step and not context.blueprint and learned then
			planetmake = true
				return {
					message = localize('k_MLPlearned')
				}			
		end

		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			planetmake = false
			learned = false
			card.ability.extra.learned = false
                local _poker_hands = {}
				for k, v in pairs(G.GAME.hands) do
                    if v.visible and k ~= card.ability.extra.poker_hand then _poker_hands[#_poker_hands+1] = k end
                    end
                    card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('fiduciacompellus'))
                    return {
                        message = localize('k_reset')
                    }
                end						
            end
}

--[[ SMODS.Joker { -- Tattoo Card
    key = "MLPTattooCard",
    config = { extra = { xmult = 0.75, stickers = 0 } },
    rarity = 3,
	atlas = 'MLPJokers2',
    pos = { x = 3, y = 1 },
    cost = 7,
    blueprint_compat = true,
    perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			card.ability.extra.stickers = 0
			for k, v in pairs(G.jokers.cards) do
				if (v.ability.eternal or v.ability.perishable or v.ability.rental) then
					card.ability.extra.stickers = card.ability.extra.stickers + 1
				end
				print(card.ability.extra.stickers)
        	return {
            	xmult = 1+(card.ability.extra.xmult*card.ability.extra.stickers)
        	}
			end
		end
	end,
	in_pool = function(self, args)
			for k, v in pairs(G.jokers.cards) do
            if (v.ability.eternal or v.ability.perishable or v.ability.rental) then
                return true
            end
        end
        return false
    end
} ]]

SMODS.Joker { -- Tattoo Card
    key = "MLPTattooCard",
    config = { extra = { xmult = 0.75, stickers = 0 } },
    rarity = 3,
	atlas = 'MLPJokers2',
    pos = { x = 3, y = 1 },
    cost = 7,
    blueprint_compat = true,
    perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
		if context.before and not context.blueprint then
			card.ability.extra.stickers = 0
		end	
		if context.other_joker and (context.other_joker.ability.eternal or context.other_joker.ability.perishable or context.other_joker.ability.rental) and not context.blueprint then
            card.ability.extra.stickers = card.ability.extra.stickers + 1
			-- print(card.ability.extra.stickers)
		end
		if context.joker_main then
        	return {
            	xmult = 1+(card.ability.extra.xmult*card.ability.extra.stickers)
        	}
			end
	end,
	in_pool = function(self, args)
			for k, v in pairs(G.jokers.cards) do
            if (v.ability.eternal or v.ability.perishable or v.ability.rental) then
                return true
            end
        end
        return false
    end
}

SMODS.Joker { -- Fanfic Author Twilight
    key = "MLPFATwilight",
    config = { extra = { chips = 0, chips_gain = 4 } },
    rarity = 1,
	atlas = 'MLPJokers2',
    pos = { x = 4, y = 1 },
    cost = 5,
    blueprint_compat = true,
    perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, localize('Pair', 'poker_hands'), card.ability.extra.chips_gain } }
    end,
    calculate = function(self, card, context)
			local playedcards = {}
			local counts = {}
			local pairsno = 0
        if context.before and context.main_eval and not context.blueprint then
			for i=1, #context.scoring_hand do
				if not SMODS.has_no_rank(context.scoring_hand[i]) then
					table.insert(playedcards, context.scoring_hand[i].base.id)
				end
				-- print(playedcards)
			end
			for _, value in ipairs(playedcards) do
				counts[value] = (counts[value] or 0) + 1
			end
				-- print(counts)
			for _, count in pairs(counts) do
				if count >= 2 then
					pairsno = pairsno + 1
				end	
				-- print(pairsno)
			end
			if pairsno >= 1 then
            	card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_gain*pairsno)
            	return {
                	message = localize('k_upgrade_ex'),
                	colour = G.C.BLUE
            	}		
		end
    end
        if context.joker_main then
            return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
            }
        end
	end

}

SMODS.Joker { -- Queen Chrysalis
	key = 'MLPChrysalis',
	config = { extra = { xmult = 1, xmult_gain = 0.2, cards_to_destroy = 2 } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 1, y = 0 },
	cost = 7,
	blueprint_compat = true,
    perishable_compat = false,	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain, card.ability.extra.cards_to_destroy } }
	end,
    calculate = function(self, card, context)
 		if context.setting_blind and context.main_eval and not context.blueprint then
			local drained = false
			for i = 1, card.ability.extra.cards_to_destroy do
			local enhancedcards = {}
		        for _, playing_card in ipairs(G.deck.cards or {}) do
            if not SMODS.has_enhancement(playing_card, 'c_base') then
                table.insert(enhancedcards, playing_card)
				end
            end
			local card_to_destroy, rem = pseudorandom_element(enhancedcards, pseudoseed("thisdayhasbeenjustperfect"))
			table.remove(enhancedcards, rem)			
        		if card_to_destroy then
					drained = true
			card_to_destroy:set_ability('c_base', nil, true)
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
				end	
			end
			if drained then
				SMODS.calculate_effect({ message = localize('k_MLPdrained') }, card)	
				drained = false
			end
		end
	    if context.joker_main then
        return {
            xmult = card.ability.extra.xmult
        }
		end
    end
}

SMODS.Joker { -- Lord Tirek
	key = 'MLPTirek',
	config = { extra = { xmult = 1, xmult_gain = 0.15 } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 0, y = 0 },
	cost = 7,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
	end,

	update = function(self, card, dt)
		if G.deck and card.added_to_deck then
			for i, v in pairs(G.playing_cards) do
				if v.ability.MLPtirekdebuff == true then
					v:set_debuff(true)
				end
			end
		end
	end,

    calculate = function(self, card, context)
 		if context.before and not context.blueprint then
			local notdebuffed = 0
		for i=1, #context.scoring_hand do
            if not context.scoring_hand[i].debuff then 
				notdebuffed = notdebuffed + 1
				end			
			end
			card.ability.extra.xmult = card.ability.extra.xmult + ( card.ability.extra.xmult_gain * notdebuffed ) 
		end

		if context.final_scoring_step then
				return {
				message = localize('k_MLPdrained'),
				G.E_MANAGER:add_event(Event({
					trigger = 'immediate',
					func = function()
						for i, v in pairs(context.scoring_hand) do
						v.ability.MLPtirekdebuff = true
						v:juice_up()
						end
						return true
					end
				}))
			}
		end

	    if context.joker_main then
        return {
            xmult = card.ability.extra.xmult
        }
		end

		if context.selling_self or context.getting_sliced then
				return {
				G.E_MANAGER:add_event(Event({
					trigger = 'immediate',
					func = function()

						for i, v in pairs(G.playing_cards) do
						v.ability.MLPtirekdebuff = false
						end

						return true
					end
				}))
			}
		end

        if context.end_of_round and context.game_over == false and not context.blueprint then
		        if G.GAME.blind.boss then
				card.ability.extra.xmult = 1	
				return {
				message = localize('k_reset'),
				G.E_MANAGER:add_event(Event({
					trigger = 'immediate',
					func = function()

						for i, v in pairs(G.playing_cards) do
						v.ability.MLPtirekdebuff = false
						end

						return true
					end
				}))
			}
            end
		end
    end
}

 SMODS.Joker { -- Cozy Glow
	key = 'MLPCozyGlow',
	config = { extra = { cards_to_destroy = 2 } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 2, y = 0 },
	cost = 7,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cards_to_destroy } }
	end,
    calculate = function(self, card, context)
	local converted = false
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

	 if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 and not context.blueprint and not context.repetition then
		local suits = {}
		local used_suits = {}
			if context.full_hand[1].ability.name ~= 'Wild Card' then
				if not suits[context.full_hand[1].base.suit] then
					suits[context.full_hand[1].base.suit] = 1
					used_suits[#used_suits + 1] = context.full_hand[1].base.suit
				else
					suits[context.full_hand[1].base.suit] = suits[context.full_hand[1].base.suit] + 1
				end
			end
		local value = 0
		if #used_suits ~= 0 then
			for i = 1, #used_suits do
				if suits[used_suits[i]] > value then
					discriminated_suit = used_suits[i]
					value = suits[used_suits[i]]
				end
			end
		else
			discriminated_suit = 'Wild'
		end

		local cozyglow_card_candidates = {}
		if discriminated_suit ~= 'Wild' then
			for i = 1, #G.hand.cards do
				if not G.hand.cards[i]:is_suit(discriminated_suit, true) then
					cozyglow_card_candidates[#cozyglow_card_candidates + 1] = G.hand.cards[i]
				end
			end
		else
			for i = 1, #G.hand.cards do
					cozyglow_card_candidates[#cozyglow_card_candidates + 1] = G.hand.cards[i]
				end
			end

						if cozyglow_card_candidates then
							for i = 1, card.ability.extra.cards_to_destroy do	
							local cozy_destroyed_card, rem = pseudorandom_element(cozyglow_card_candidates, pseudoseed('friendshipispower'))
							table.remove(cozyglow_card_candidates, rem)
								if cozy_destroyed_card then
                    		SMODS.destroy_cards(cozy_destroyed_card)
								end
							end
					return {
					message = localize('k_MLPdestroyed'),
					colour = G.C.MULT,
					card = card					
					}							
						end
		end		
		end 
	}

SMODS.Joker {  -- Coronation Twilight
	key = 'MLPCoronationTwilight',
	config = { extra = { xmult = 1, xmult_gain = 0.15 } },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 0, y = 2 },
	cost = 7,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain,  } }
	end,
    calculate = function(self, card, context)	
		local inbooster = false
		if not context.blueprint and context.open_booster then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain		
				return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}},
                    colour = G.C.RED,
                    card = card
						}
		end
		if not context.blueprint and context.skipping_booster and card.ability.extra.xmult > 1 then
			card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_gain	
				return {
                    message = localize{type = 'variable', key = 'a_xmult', vars = {-card.ability.extra.xmult_gain}},
                   	colour = G.C.RED,
                    card = card
						}			
		end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
		end
	end
}

SMODS.Joker {  -- Wonderbolt Dash
	key = 'MLPWonderboltDash',
	config = { extra = { xmult = 0.4,} },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 1, y = 2 },
	cost = 7,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult  } }
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = 1 + (G.GAME.current_round.hands_left * card.ability.extra.xmult)
            }
        end
    end
}

SMODS.Joker {  -- Pinkamena
	key = 'MLPPinkamena',
	config = { extra = { xmult = 2 , dollars = 2, scoreodds = 2, moneyodds = 2 } },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 2, y = 2 },
	cost = 7,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.dollars, card.ability.extra.scoreodds, card.ability.extra.moneyodds, G.GAME.probabilities.normal  } }
	end,
    calculate = function(self, card, context)
	local ret1 = { dollars = -(card.ability.extra.dollars), card = card }		
	local ret2 = { xmult = card.ability.extra.xmult}

        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
		local effects = {}			
			if pseudorandom(pseudoseed('cupcakes')) < G.GAME.probabilities.normal / card.ability.extra.scoreodds then
				table.insert(effects, ret2)
			end
			if pseudorandom(pseudoseed('theyreabunchalosers')) < G.GAME.probabilities.normal / card.ability.extra.moneyodds then
    			table.insert(effects, ret1)		
			end
			return SMODS.merge_effects(effects)			
		end
	end
}


SMODS.Joker {  -- Plainity
	key = 'MLPPlainity',
	config = { extra = { mult = 5, chips = 25 } },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 3, y = 2 },
	cost = 7,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.chips } }
	end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "c_base") and not context.other_card.edition and not context.other_card.seal then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }				
		end
	end
}

SMODS.Joker {  -- Apple Jewel
	key = 'MLPAppleJewel',
	config = { extra = { xmult = 3, notjacks = 0} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 4, y = 2 },
	cost = 7,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and not context.blueprint then
			card.ability.extra.notjacks = 0
			for i=1, #context.scoring_hand do
				if context.scoring_hand[i]:get_id() ~= 11 then
		card.ability.extra.notjacks = card.ability.extra.notjacks + 1
				end
			end		
		end
	
		if context.joker_main and card.ability.extra.notjacks == 0 then
          return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
            colour = G.C.RED,
            Xmult_mod = card.ability.extra.xmult
          }
		end			
	end
}

SMODS.Joker { -- Flutterbat
    key = "MLPFlutterbat",
    config = { extra = { dollars_gain = 3, dollars = 0 } },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 5, y = 2 },
	cost = 7,
	blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars_gain, card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.MLPflutterbat then
                    enhanced[#enhanced + 1] = scored_card
                    scored_card.MLPflutterbat = true
                    scored_card:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.MLPflutterbat = nil
                            return true
                        end
                    }))
                end
            end

            if #enhanced > 0 then
                card.ability.extra.dollars = card.ability.extra.dollars + ( card.ability.extra.dollars_gain * #enhanced )
                return {
                    message = localize('k_MLPhiss'),
                    colour = G.C.MONEY
                }
            end
        end
    end,

	calc_dollar_bonus = function(self, card)
		local money = card.ability.extra.dollars
		if G.GAME.blind then
            card.ability.extra.dollars = 0
        end
        return money
	end
}


--[[ SMODS.Joker { -- Flutterbat
    key = "MLPFlutterbat",
    config = { extra = { Xmult_gain = 0.2, Xmult = 1 } },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 5, y = 2 },
	cost = 7,
	blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.MLPflutterbat then
                    enhanced[#enhanced + 1] = scored_card
                    scored_card.MLPflutterbat = true
                    scored_card:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.MLPflutterbat = nil
                            return true
                        end
                    }))
                end
            end

            if #enhanced > 0 then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain * #enhanced
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
        if context.end_of_round and context.game_over == false and not context.blueprint then
		        if G.GAME.blind.boss then
				card.ability.extra.Xmult = 1	
				return {
				message = localize('k_reset'),
				G.E_MANAGER:add_event(Event({
					trigger = 'immediate',
					func = function()

						for i, v in pairs(G.playing_cards) do
						v.ability.MLPflutterbat = false
						end

						return true
					end
				}))
			}
            end		
		end
    end
}
 ]]

SMODS.Joker { -- Babs Seed
	key = 'MLPBabsSeed',
    config = { extra = { mult = 0, mult_mod = 1, money_req = 2, money_spent = 0 } },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 1, y = 4 },
	cost = 6,
	blueprint_compat = true,
	perishable_compat = false,	
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod, card.ability.extra.money_req, card.ability.extra.money_spent}}
    end,
    calculate = function(self, card, context)
	to_big = to_big or function(a) return a end
	if context.starting_shop and not context.blueprint then
		local moneygained = math.floor((G.GAME.MLPlastcashout / card.ability.extra.money_req)*card.ability.extra.mult_mod)
		card.ability.extra.mult = card.ability.extra.mult + moneygained
				return {
                    delay = 0.5,
                    message = localize{type='variable',key='a_mult',vars={moneygained}},
                    colour = G.C.RED
                }
	end

    if context.cardarea == G.jokers and context.joker_main then
            return {
                message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}},
                mult_mod = card.ability.extra.mult
            }
        end
	end
}

--[[ SMODS.Joker { -- Collector Card
	key = 'MLPCollectorCard',
	config = { extra = { mult = 0, mult_gain = 1 } },
	loc_vars = function(self, info_queue, card)
        local playedcards_tally = 0
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(playing_card.debuff_card.ability.played_this_ante) then playedcards_tally = playedcards_tally + 1 end
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, playedcards_tally } }
    end,
	rarity = 1,
	atlas = 'MLPJokers2',
	pos = { x = 1, y = 3 },
	cost = 6,
	blueprint_compat = false,
	
    calculate = function(self, card, context)
        if context.joker_main then
            local playedcards_tally = 0
            for _, playing_card in pairs(G.playing_cards) do
                if next(context.debuff_card.ability.played_this_ante(playing_card)) then playedcards_tally = playedcards_tally + 1 end
            end
                return {
                    mult_mod = card.ability.extra.mult
                }
        end
    end,
}  ]]

SMODS.Joker { -- King Sombra
	key = 'MLPSombra',
	config = { extra = { xmult = 3 } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 4, y = 3 },
	cost = 8,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,

	update = function(self, card, dt)
		if G.deck and card.added_to_deck then
			for i, v in pairs(G.playing_cards) do
				if SMODS.has_enhancement(v, "c_base") then
					v:set_debuff(true)
				end
			end
		end
	end,

    calculate = function(self, card, context)
	    if context.joker_main then
        return {
            xmult = card.ability.extra.xmult
        }
		end
    end
}

SMODS.Joker {  -- Autumn Blaze
	key = 'MLPAutumnBlaze',
	config = { extra = { repetitions = 3, selectedcard = 0 } },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 3, y = 3 },
	cost = 5,
	blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions, card.ability.extra.selectedcard } }
    end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.selectedcard = pseudorandom("silhouettegloomofthesundownlands", 1, #context.scoring_hand)
		end
		if context.cardarea == G.play and context.repetition and not context.repetition_only and #context.scoring_hand >= 3 then
			-- print(card.ability.extra.selectedcard)			
			if context.other_card == context.scoring_hand[card.ability.extra.selectedcard] then
			return {
					message = localize('k_again_ex'),
					repetitions = card.ability.extra.repetitions,
					card = card
				}
			end
		end
	end
}

SMODS.Joker { -- Shining Armor
    key = "MLPShiningArmor",
	config = { extra = { xmult = 1.5 } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 2, y = 3 },
	cost = 7,
	blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            SMODS.has_enhancement(context.other_card, 'm_steel') then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then
                return true
            end
        end
        return false
    end
}

SMODS.Joker { -- Zap Apple Jam
	key = 'MLPZapAppleJam',
	config = { extra },
	rarity = 2,
	atlas = 'MLPJokers2',
	pos = { x = 0, y = 4 },
	cost = 7,
	eternal_compat = false,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        return { vars = { localize { type = 'name_text', set = 'Tag', key = 'tag_double' } } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
	        G.E_MANAGER:add_event(Event({
	            trigger = 'after',
	            delay = 0.4,
	            func = function()
	                local edition = 'e_polychrome'
	                local poly_card = pseudorandom_element(G.hand.cards, pseudoseed('itsrainbowdashinajarlmaogetitnowlaughatit'))
					if poly_card then
	                	poly_card:set_edition(edition, true)
	                	card:juice_up(0.3, 0.5)
					end
	                return true
	            end
	        }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end,
}

--[[ SMODS.Joker {  -- Smarty Pants
	key = 'MLPSmartyPants',
	config = { extra = { mult = 0, mult_gain = 1 } },
	rarity = 1,
	atlas = 'MLPJokers2',
	pos = { x = 0, y = 3 },
	cost = 5,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
    calculate = function(self, card, context)	
        if context.discard and not context.blueprint and #context.full_hand == 1 then
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
				end
				if context.discard and not context.blueprint and #context.full_hand > 1 then 
				local last_mult = card.ability.extra.mult
                            card.ability.extra.mult = 0
                            if last_mult > 0 then 
                                return {
                                    card = card,
                                    message = localize('k_reset')
                                }
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
 ]]

SMODS.Joker { -- Friendship is Benefits
    key = "MLPFIBenefits",
    config = { extra = { dollars = 0, dollars_gain = 3 } },
    rarity = 2,
	atlas = 'MLPJokers2',
    pos = { x = 5, y = 1 },
    cost = 7,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.dollars_gain, localize('Straight', 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
			if next(context.poker_hands['Straight Flush']) then
				card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_gain + 1
				return {
					message = localize('k_val_up'),
					colour = G.C.MONEY,
					card = card
				}
			elseif next(context.poker_hands['Straight']) then
				card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_gain
				return {
					message = localize('k_val_up'),
					colour = G.C.MONEY,
					card = card
				}
			end
        end
    end,

    calc_dollar_bonus = function(self, card)
		local money = card.ability.extra.dollars
		if G.GAME.blind.boss then
            card.ability.extra.dollars = 0
        end
        return money
	end

}

 SMODS.Joker { -- Princess Celestia
	key = 'MLPCelestia',
	config = { extra = { xmult_gain = 0.3, xmult = 1 } },
	rarity = 4,
	atlas = 'MLPJokers2',
	pos = { x = 3, y = 4 },
	soul_pos = { x = 3, y = 5 },		
	cost = 20,
	blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
		local enhance_tally = 0
		local edition_tally = 0
		local seal_tally = 0		
		local total_tally = 1		
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then enhance_tally = enhance_tally + 1 end
			if playing_card.edition then edition_tally = edition_tally + 1 end
			if playing_card.seal then seal_tally = seal_tally + 1 end
			total_tally = card.ability.extra.xmult + (card.ability.extra.xmult_gain *(enhance_tally + edition_tally + seal_tally))
        end
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain, enhance_tally, edition_tally, seal_tally, total_tally } }
    end,
	calculate = function(self, card, context)
	        if context.joker_main then
		local enhance_tally = 0
		local edition_tally = 0
		local seal_tally = 0		
		local total_tally = 0		
        for _, playing_card in pairs(G.playing_cards or {}) do
            if next(SMODS.get_enhancements(playing_card)) then enhance_tally = enhance_tally + 1 end
			if playing_card.edition then edition_tally = edition_tally + 1 end
			if playing_card.seal then seal_tally = seal_tally + 1 end
			-- total_tally = card.ability.extra.xmult + (card.ability.extra.xmult_gain *(enhance_tally + edition_tally + seal_tally))
        end		
            return {
                xmult = card.ability.extra.xmult + (card.ability.extra.xmult_gain *(enhance_tally + edition_tally + seal_tally))
            }
        end
	end
}

 SMODS.Joker {  -- Princess Luna
	key = 'MLPLuna',
	config = { extra = { xmult_gain = 0.15, xmult = 1 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
	end,
	rarity = 4,
	atlas = 'MLPJokers2',
	pos = { x = 4, y = 4 },
	soul_pos = { x = 4, y = 5 },		
	cost = 20,
	blueprint_compat = true,
	perishable_compat = false,	
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.xmult > 0 then
			return {
                xmult = card.ability.extra.xmult
			}
		end
		if context.before and not context.blueprint then
		local redcheck = false
			for i = 1, #context.full_hand do
				if context.full_hand[i]:is_suit('Hearts', true) or context.full_hand[i]:is_suit('Diamonds', true) then
					redcheck = true
				end
			end		
	
		if not redcheck then
			card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmult_gain * #context.scoring_hand)
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				card = card
			}
				end
			end
		end
}

 SMODS.Joker {  -- Princess Cadance
	key = 'MLPCadance',
	config = { extra = { xmult = 1.5 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
	end,
	rarity = 4,
	atlas = 'MLPJokers2',
	pos = { x = 5, y = 4 },
	soul_pos = { x = 5, y = 5 },		
	cost = 20,
	blueprint_compat = true,
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
				x_mult = card.ability.extra.xmult,
				colour = G.C.RED,
				card = card
                }
			end
        end
      end
	end
}

SMODS.Joker { -- Masked Matter-Horn
	key = 'MLPMatterhorn',
	config = { extra = { repetitions = 1 } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 0, y = 6 },
	cost = 8,
	blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
		return { vars = { card.ability.extra.repetitions } }		
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and SMODS.get_enhancements(context.other_card)["m_glass"] == true then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.repetitions,
                card = card
            }
        
        elseif context.repetition and context.cardarea == G.hand and SMODS.get_enhancements(context.other_card)["m_glass"] == true then
            if (next(context.card_effects[1]) or #context.card_effects > 1) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card
                }
            end
        end
    end,
		    in_pool = function(self, args)
        for _, playing_card in pairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_glass') then
                return true
            end
        end
        return false
    end
}

SMODS.Joker { -- Zapp
	key = 'MLPZapp',
	config = { extra = { xmult = 1, xmult_gain = 0.25 } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 1, y = 6 },
	cost = 8,
	blueprint_compat = true,
    perishable_compat = false,	
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.xmult > 1 then
			return {
            	message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
            	colour = G.C.RED,
            	Xmult_mod = card.ability.extra.xmult				
			}
		end

		    if context.end_of_round and G.GAME.current_round.hands_played == 1 and not context.repetition and context.game_over == false and not context.blueprint then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				card = card
			}
		end
	end
}


SMODS.Joker { -- Fili-Second
	key = 'MLPFiliSecond',
	config = { extra = { xmult = 0.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 2, y = 6 },
	cost = 8,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.joker_main and context.full_hand then
				return {
					Xmult = (#G.hand.cards * card.ability.extra.xmult),
				}
		end
	end
}


SMODS.Joker { -- Radiance
	key = 'MLPRadiance',
	config = { extra = { } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 3, y = 6 },
	cost = 8,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return 
	end,
	calculate = function(self, card, context)
	    if context.final_scoring_step and (hand_chips * mult > (G.GAME.blind.chips * 2)) then
				local tag = MLP.MLPpoll_tag("MLPRadiance")
				add_tag(tag)
				card:juice_up()
            end
		end
 }
 
 function MLP.MLPpoll_tag(seed, options, exclusions)
	local pool = options or get_current_pool("Tag")
	if exclusions then
		for excluded_index = 1, #exclusions do
			for pool_index = 1, #pool do
				if exclusions[excluded_index] == pool[pool_index] then
					table.remove(pool, pool_index)
					break
				end
			end
		end
	end
	local tag_key = pseudorandom_element(pool, pseudoseed(seed))

	while tag_key == "UNAVAILABLE" do
		tag_key = pseudorandom_element(pool, pseudoseed(seed))
	end

	local tag = Tag(tag_key)

	if tag_key == "tag_orbital" then
		local available_hands = {}

		for k, hand in pairs(G.GAME.hands) do
			if hand.visible then
				available_hands[#available_hands + 1] = k
			end
		end

		tag.ability.orbital_hand = pseudorandom_element(available_hands, pseudoseed(seed .. "_orbital"))
	end

	return tag
end

 SMODS.Joker {  -- Mistress Mare-velous
    key = "MLPMarevelous",
	config = { extra = { xmult = 1.5 } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 4, y = 6 },
	cost = 8,
	blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card and
            context.other_card:get_id() == 11 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}
 

 SMODS.Joker {  -- Saddle Rager
	key = 'MLPSaddleRager',
    config = {
        extra = { Xmult = 1, Xmult_mod = 0.2, total = 0, so_far = 0 }
    },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 5, y = 6 },
	cost = 8,
	blueprint_compat = true,
	perishable_compat = false,		
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_mod}}
    end,

    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.Xmult = 1
            card.ability.extra.total = card.ability.extra.total + 1
            card.ability.extra.so_far = 0
        elseif context.cardarea == G.play and context.individual then
            local thunk = card.ability.extra.Xmult
            card.ability.extra.so_far = card.ability.extra.so_far + 1

            if card.ability.extra.so_far == card.ability.extra.total then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
                card.ability.extra.so_far = 0
            end
                return {
					message = localize('k_upgrade_ex'),
					colour = G.C.MULT,
                }
		elseif context.joker_main then
			return {
                xmult = card.ability.extra.Xmult
			}
        elseif context.after then 
            card.ability.extra.total = 0
            card.ability.extra.Xmult = 1
                    return {
                        message = localize('k_reset')
                    }			
        	end
    	end
}

SMODS.Joker { -- Hum Drum
	key = 'MLPHumDrum',
	config = { extra = { } },
	rarity = 3,
	atlas = 'MLPJokers2',
	pos = { x = 0, y = 7 },
	cost = 8,
	blueprint_compat = true,
    calculate = function(self, card, context)
        if G.GAME.current_round.hands_left <= 1 and not context.blueprint then
            if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
                return {
                    message = localize('ph_boss_disabled'),
                    func = function() -- This is for timing purposes, it runs after the message
                        G.GAME.blind:disable()
                    end
                }
            end
        end
    end
}