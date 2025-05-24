
SMODS.Atlas {
	key = "MLPJokers",
	path = "MLPJokers.png",
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

-- Twilight Sparkle
SMODS.Joker {
	key = 'MLPTwilight',
	loc_txt = {
		name = 'Twilight Sparkle',
		text = {
			[1] = "Adds the {C:attention}rank {}",
			[2] = "of the {C:attention}highest {}card",
			[3] = "in played hand to Mult"
		}
	},
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

-- Rainbow Dash
SMODS.Joker {
	key = 'MLPRainbow',
	loc_txt = {
		name = 'Rainbow Dash',
		text = {
			"This Joker gains {C:mult}+#2#{} Mult",
			"at end of round if first",
			"played hand clears the {C:attention}Blind{}",
			"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
		}
	},
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

-- Pinkie Pie
SMODS.Joker {
	key = 'MLPPinkie',
	config = { extra = { chips = 155 } },
	loc_txt = {
		name = 'Pinkie Pie',
		text = {
            [1] = "{C:chips}+#1#{} Chips if played",
			[2] = "hand contains",
			[3] = "{C:attention}5 face{} cards",
		}
	},
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

-- Rarity
SMODS.Joker {
	key = 'MLPRarity',
	loc_txt = {
		name = 'Rarity',
		text = {
			[1] = "On {C:attention}first hand{} of round,",
			[2] = "earn {C:attention}half{} of the {C:attention}highest{}",
			[3] = "ranked card in played hand as {C:money}money{}"
		}
	},
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
 
 -- Applejack
 SMODS.Joker {
	key = 'MLPApplejack',
	loc_txt = {
		name = 'Applejack',
		text = {
			"Retrigger the",
			"{C:attention}last two{} played cards"
		}
	},
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
 
 -- Fluttershy
 SMODS.Joker {
	key = 'MLPFluttershy',
	config = { extra = { chips = 0, chips_gain = 15 } },
	loc_txt = {
		name = 'Fluttershy',
		text = {
            "This Joker gains {C:chips}+#2#{} Chips",
			"if there are no",
			"{C:attention}face{} cards held in hand",
			"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
		}
	},
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

-- Spike
SMODS.Joker {
	key = 'MLPSpike',
	config = { extra = { poker_hand = "High Card" } },
	loc_txt = {
		name = 'Spike',
		text = {
            "Create a {C:tarot}Tarot{} card",
			"if {C:attention}poker hand{} is a {C:attention}#1#{},",
			"poker hand changes when",
			"Tarot card is created",
			"{C:inactive}(Must have room)"
		}
	},
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
		card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed("spikethedragon"))
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
			
		if context.final_scoring_step and tarotmake and not context.blueprint then
                local _poker_hands = {}
				tarotmake = false
                for k, v in pairs(G.GAME.hands) do
                    if v.visible and k ~= card.ability.extra.poker_hand then _poker_hands[#_poker_hands+1] = k end
                    end
                    card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('spikethedragon'))
                    return {
                        message = localize('k_reset')
                    }
					
                end
		end
}

-- Starlight Glimmer (old)
-- SMODS.Joker {
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

-- Starlight Glimmer
SMODS.Joker {
	key = 'MLPStarlight',
	config = { extra = { xmult = 4 } },
	loc_txt = {
		name = 'Starlight Glimmer',
		text = {
            "{X:mult,C:white}X#1#{} Mult if played hand contains",
			"{C:attention}3 or more{} cards with the",
			"same {C:attention}rank{}, {C:attention}suit{}, and {C:attention}enhancement{}"
		}
	},
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
		if context.joker_main and not context.blueprint then

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
				
			


-- Trixie
SMODS.Joker {
	key = 'MLPTrixie',
	loc_txt = {
		name = 'Trixie',
		text = {
            "When {C:attention}Blind{} is selected,",
			"destroy a random card in your {C:attention}full deck{}",
			"and add a random card to your hand",
			"with a random {C:dark_edition}edition{} or {C:attention}enhancement{}",
		}
	},
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
                local card_to_destroy, _ = pseudorandom_element(G.deck.cards, pseudoseed("trixielulamoon"))
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

-- Sunset Shimmer
 SMODS.Joker {
	key = 'MLPSunsetShimmer',
	loc_txt = {
		name = 'Sunset Shimmer',
		text = {
			"On {C:attention}first hand{} of round,", 
			"convert all played cards into",
			"their {C:attention}next suit{} after scoring", 
			"{C:inactive}(e.g.{} {C:spades}Spades{} {C:inactive}become{} {C:hearts}Hearts{},",
			"{C:clubs}Clubs{} {C:inactive}become{} {C:diamonds}Diamonds{}{C:inactive}){}"
		}
	},
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
			

-- Lyra and Bon Bon
SMODS.Joker {
	key = 'MLPLyrabon',
	loc_txt = {
		name = 'Lyra and Bon Bon',
		text = {
            "{C:attention}+#1#{} hand size,",
			"{C:red}#2#{} discards each round",
		}
	},
	config = { extra = { hand_size = 3, discards = -2 } },
	rarity = 2,
	atlas = 'MLPJokers',
	pos = { x = 4, y = 1 },
	cost = 5,
	blueprint_compat = true,
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
-- SMODS.Joker {
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
		
-- Maud Pie		
SMODS.Joker {
	key = 'MLPMaud',
	loc_txt = {
		name = 'Maud Pie',
		text = {
            "Each {C:attention}Stone Card{}",
			"held in hand",
			"gives {X:mult,C:white}X#1#{} Mult",
		}
	},
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
								-- message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
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

-- Apple Bloom
 SMODS.Joker {
	key = 'MLPAppleBloom',
	loc_txt = {
		name = 'Apple Bloom',
		text = {
			"The {C:attention}last two{} played cards",
			"each give {X:mult,C:white}X#1#{} Mult when scored",
			"if both cards are the {C:attention}same rank{}"
		}
	},
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

-- Sweetie Belle
SMODS.Joker {
	key = 'MLPSweetieBelle',
	loc_txt = {
		name = 'Sweetie Belle',
		text = {
            "This Joker gains the {C:attention}rank{}",
			"of the {C:attention}highest card{} in played hand",
			"as {C:chips}Chips{} when a hand is played",
			"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"			
		}
	},
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
 
 -- Scootaloo
 SMODS.Joker {
    key = "MLPScootaloo",
		loc_txt = {
		name = 'Scootaloo',
		text = {
            "Earn {C:money}$#1#{} at end of round",
			"Payout increases by {C:money}$#2#{} if",
			"first played hand clears the {C:attention}Blind{}"
		}
	},
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

-- Big McIntosh
 SMODS.Joker {
	key = 'MLPBigMac',
	loc_txt = {
		name = 'Big McIntosh',
		text = {
			"{C:green}#3# in #2#{} chance to retrigger",
			"each played card {C:attention}#1#{} times"
		}
	},
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
			if pseudorandom(pseudoseed('bigmcintosh')) < G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					message = 'Eeyup!',
					repetitions = card.ability.extra.retriggers,
					-- The card the repetitions are applying to is context.other_card
					card = context.other_card
				}
			end
		end
	end
}

-- Zecora
 SMODS.Joker {
	key = 'MLPZecora',
	loc_txt = {
		name = 'Zecora',
		text = {
			"If exactly {C:attention}4{} cards are played in hand",
			"and a {C:green}#2# in #1#{} chance succeeds as planned",
			"then a {C:tarot}Tarot{} card will be prepared",
			"{C:inactive}(Just ensure you have room to spare)"
		}
	},
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
			if pseudorandom(pseudoseed('zecora')) < G.GAME.probabilities.normal / card.ability.extra.odds and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
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

-- Derpy
 SMODS.Joker {
	key = 'MLPDerpy',
	loc_txt = {
		name = 'Derpy',
		text = {
			"{C:attention}Retrigger{} every",
			"{C:green}successfully{} triggered",
			"{C:attention}Lucky Card{}"
		}
	},
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
        if context.repetition and context.cardarea == G.play and SMODS.get_enhancements(context.other_card)["m_lucky"] == true and context.other_card.lucky_trigger then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
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
	
-- DJ PON-3
 SMODS.Joker {
	key = 'MLPDJPON3',
	loc_txt = {
		name = 'DJ PON-3',
		text = {
			"Each played {C:attention}#2#{} gives {C:chips}+#1#{} Chips",
			"when scored, chosen rank",
			"{C:attention}increases{} at end of round"
		}
	},
	config = { extra = { chips = 50 } },
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
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			return {
				message = 'Next Track!',
				colour = G.C.CHIPS,
				card = card
			}
        end
    end
}
-- Octavia Melody
 SMODS.Joker {
	key = 'MLPOctavia',
	loc_txt = {
		name = 'Octavia Melody',
		text = {
			"Each played {C:attention}#2#{} gives {C:mult}+#1#{} Mult",
			"when scored, chosen rank",
			"{C:attention}increases{} at end of round"
		}
	},
	config = { extra = { mult = 8 } },
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
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			return {
				message = 'Next Piece!',
				colour = G.C.MULT,
				card = card
			}
        end
    end
}

-- Functions for DJ PON-3 and Octavia
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.MLPMUSIC_card = { id = 14, rank = 'Ace' }
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	local valid_music_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if v.ability.effect ~= 'Stone Card' then
            valid_music_cards[#valid_music_cards+1] = v
        end
    end
	if valid_music_cards[1] then
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

-- Discord
SMODS.Joker {
	key = 'MLPDiscord',
	loc_txt = {
		name = 'Discord',
		text = {
            "{X:mult,C:white}X#1#{} Mult if played",
			"hand is a {C:attention}#2#{},",
			"amount and poker hand",
			"are {C:attention}randomized{} when a hand",
			"is {C:attention}played{} or {C:attention}discarded{}",			
		}
	},
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

-- Elements of Harmony
SMODS.Joker {
	key = 'MLPElements',
	loc_txt = {
		name = 'Elements of Harmony',
		text = {
            "{X:mult,C:white}X#1#{} Mult if there",
			"are at least {C:attention}#2#{} Jokers",
		}
	},
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
 
-- Crystal Heart
SMODS.Joker {
	key = 'MLPCrystalHeart',
	loc_txt = {
		name = 'Crystal Heart',
		text = {
            "Each card with",
			"{C:hearts}Heart{} or {C:diamonds}Diamond{} suit",
			"held in hand gives {C:chips}+#1#{} Chips"
		}
	},
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
 
 -- Sonic Rainboom
 SMODS.Joker {
	key = 'MLPSonicRainboom',
	loc_txt = {
		name = 'Sonic Rainboom',
		text = {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
			"when a {C:attention}Blind{} is skipped, resets",
			"when a {C:attention}non-Boss Blind{} is cleared",
			"{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"	
		}
	},
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

 -- Nap Time
 SMODS.Joker {
	key = 'MLPNapTime',
	loc_txt = {
		name = 'Nap Time',
		text = {
			"This Joker gains {C:mult}+#2#{} Mult",
            "per {C:attention}consecutive{} hand played",
			"that contains {C:attention}unscored{} cards",
			"{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult){}"	
		}
	},
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
						return {
							message = 'Upgraded!',
							colour = G.C.Mult,
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
		end
 }
 
 -- Dragon Code
 SMODS.Joker {
	key = 'MLPDragonCode',
	loc_txt = {
		name = 'Dragon Code',
		text = {
			"Once per round,",
            "create a {C:tarot}Tarot{} card",
			"when a {C:tarot}Tarot{} card is used",
			"{C:inactive}(Must have room){}"	
		}
	},
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

 -- Library Card
 SMODS.Joker {
	key = 'MLPLibraryCard',
	loc_txt = {
		name = 'Library Card',
		text = {
			"This Joker gains {C:mult}+#2#{} Mult",
            "per {C:attention}consecutive{} hand played",
			"not of the {C:attention}same type{}",
			"{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult){}"	
		}
	},
	config = { extra = { mult = 0, mult_gain = 1, lasthandtype = nil } },
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
				if card.ability.extra.lasthandtype ~= context.scoring_name then 
				card.ability.extra.lasthandtype = context.scoring_name
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
						return {
							message = 'Upgraded!',
							colour = G.C.Mult,
							card = card
							}
				end
				if context.scoring_name == card.ability.extra.lasthandtype then 
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
 
 SMODS.Joker {
	key = 'MLPMuralCompetition',
	loc_txt = {
		name = 'Mural of Competition',
		text = {
			"Retrigger each played",
			"{C:attention}6{}, {C:attention}7{}, {C:attention}8{}, {C:attention}9{}, or {C:attention}10{}"
		}
	},
	config = { extra = { repetitions = 1 } },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 3, y = 5 },
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
					card = context.other_card
				}
			end
		end
	end
}

 SMODS.Joker {
	key = 'MLPMuralFriendship',
	loc_txt = {
		name = 'Mural of Friendship',
		text = {
            "This Joker gains {X:mult,C:white}X#2#{} Mult when each",
			"played {C:attention}6{}, {C:attention}7{}, {C:attention}8{}, {C:attention}9{}, or {C:attention}10{} is scored",
			"{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}"				
		}
	},
	config = { extra = { xmult_gain = 0.05, xmult = 1 } },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 4, y = 5 },
	cost = 8,
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

 SMODS.Joker {
	key = 'MLPMuralCompassion',
	loc_txt = {
		name = 'Mural of Compassion',
		text = {
            "Each played {C:attention}6{}, {C:attention}7{}, {C:attention}8{}, {C:attention}9{}, or {C:attention}10{}",
			"earns {C:money}$#1#{} when scored"
		}
	},
	config = { extra = { dollars = 1 } },
	rarity = 3,
	atlas = 'MLPJokers',
	pos = { x = 5, y = 5 },
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
 
-- Tricksy Deck
 SMODS.Back{
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

-- Our Deck
 -- SMODS.Back{
    -- name = "Our Deck",
	-- key = "MLPOurDeck",  
  -- loc_txt = {      
    -- name = 'Our Deck',      
    -- text = {
        -- "Start run with {C:attention}52{} copies",
        -- "of a {C:attention}random{} playing card,",
        -- "{C:red}X11{} base Blind size"
    -- } 
  -- }, 
	-- order = 16,
  -- unlocked = true,
  -- discovered = true,
	-- apply = function(self, back)
	-- local _suit = pseudorandom_element({'Spades','Hearts','Diamonds','Clubs'}, pseudoseed(G.SEED))
	-- local _rank = pseudorandom_element({'2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace'}, pseudoseed(G.SEED))
        -- G.E_MANAGER:add_event(Event({
            -- func = function()
                -- for _, card in ipairs(G.playing_cards) do
                        -- assert(SMODS.change_base(card, _suit, _rank))
                    -- end
            -- return true
            -- end
        -- }))
	-- G.GAME.starting_params.ante_scaling = 11
  -- end,
	-- pos = { x = 2, y = 0 },
	-- atlas = "MLPDecks"
-- }

-- local startrun = Game:start_run
-- function Game:start_run{}
	-- local ret = startrun(self)
	-- ret.starting_params.MLPOurDeck_suit = 

SMODS.Challenge{
        loc_txt = 'Chaos Dimension',
        key = 'c_MLPChaos',
        rules = {
            custom = {
                -- {id = 'no_reward'},
                -- {id = 'no_extra_hand_money'},
                -- {id = 'no_interest'},
                -- {id = 'no_shop_jokers'},
            },
            modifiers = {
                -- {id = 'dollars', value = 6},
                -- {id = 'discards', value = 3},
                -- {id = 'hands', value = 4},
                -- {id = 'reroll_cost', value = 5},
                -- {id = 'joker_slots', value = 6},
                -- {id = 'consumable_slots', value = 2},
                -- {id = 'hand_size', value = 8},
            }
        },
        jokers = {
            {id = 'j_MLP_MLPDiscord', edition = 'negative', eternal = true},
			{id = 'j_MLP_MLPDiscord', edition = 'negative', eternal = true},
			{id = 'j_MLP_MLPDiscord', edition = 'negative', eternal = true},
			{id = 'j_MLP_MLPDiscord', edition = 'negative', eternal = true},
			{id = 'j_MLP_MLPDiscord', edition = 'negative', eternal = true},
        },
        consumeables = {
        },
        vouchers = {
        },
        deck = {
            --enhancement = 'm_glass',
            --edition = 'foil',
            --gold_seal = true,
            --yes_ranks = {['3'] = true,T = true},
            --no_ranks = {['4'] = true},
            --yes_suits = {S=true},
            --no_suits = {D=true},
            -- cards = {},
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
                {id = 'c_wheel_of_fortune'},
                {id = 'c_justice'},
                {id = 'c_chariot'},
                {id = 'c_aura'},
                {id = 'c_hex'},				
				
                -- {id = 'p_buffoon_normal_1', ids = {
                    -- 'p_buffoon_normal_1','p_buffoon_normal_2','p_buffoon_jumbo_1','p_buffoon_mega_1',
                -- }},
				
                {id = 'v_magic_trick'},
                {id = 'v_illusion'},
				
                {id = 'j_stencil'},
                {id = 'j_loyalty_card'},
                {id = 'j_steel_joker'},
                {id = 'j_blackboard'},
                {id = 'j_constellation'},
                {id = 'j_cavendish'},
                {id = 'j_card_sharp'},
                {id = 'j_madness'},
                {id = 'j_vampire'},
                {id = 'j_hologram'},
                {id = 'j_baron'},
                {id = 'j_obelisk'},
				{id = 'j_photograph'},
                {id = 'j_lucky_cat'},
                {id = 'j_baseball'},
                {id = 'j_ancient'},
                {id = 'j_ramen'},
                {id = 'j_campfire'},
                {id = 'j_acrobat'},
                {id = 'j_throwback'},
                {id = 'j_bloodstone'},
                {id = 'j_glass'},
                {id = 'j_flower_pot'},
                {id = 'j_idol'},
                {id = 'j_seeing_double'},
                {id = 'j_hit_the_road'},
                {id = 'j_duo'},
                {id = 'j_trio'},
                {id = 'j_family'},
				{id = 'j_order'},
                {id = 'j_tribe'},
                {id = 'j_drivers_license'},
                {id = 'j_caino'},
                {id = 'j_triboulet'},
                {id = 'j_yorick'},
				
                {id = 'j_MLP_MLPStarlight'},
                {id = 'j_MLP_MLPMaud'},
                {id = 'j_MLP_MLPAppleBloom'},
                {id = 'j_MLP_MLPElements'},
                {id = 'j_MLP_MLPSonicRainboom'},                      
            },
            banned_tags = {
                {id = 'tag_polychrome'},
				{id = 'tag_standard'},
				
            },
            banned_other = {
            }
        }
    }
	
SMODS.Challenge{
        loc_txt = 'Teacup!',
        key = 'c_MLPTeacup',
        rules = {
            custom = {
                -- {id = 'no_reward'},
                -- {id = 'no_extra_hand_money'},
                -- {id = 'no_interest'},
                -- {id = 'no_shop_jokers'},
            },
            modifiers = {
                -- {id = 'dollars', value = 6},
                -- {id = 'discards', value = 3},
                -- {id = 'hands', value = 4},
                -- {id = 'reroll_cost', value = 5},
                -- {id = 'joker_slots', value = 6},
                -- {id = 'consumable_slots', value = 2},
                -- {id = 'hand_size', value = 8},
            }
        },
        jokers = {
            {id = 'j_MLP_MLPTrixie', eternal = true}
        },
        consumeables = {
        },
        vouchers = {
        },
         deck = {
            cards = {{s='H',r='2'},{s='H',r='3'},{s='H',r='4'},{s='H',r='5'},{s='H',r='6'},{s='H',r='7'},{s='H',r='8'},{s='H',r='9'},{s='H',r='T'},{s='H',r='J'},{s='H',r='Q'},{s='H',r='K'},{s='H',r='A'},{s='S',r='2'},{s='S',r='3'},{s='S',r='4'},{s='S',r='5'},{s='S',r='6'},{s='S',r='7'},{s='S',r='8'},{s='S',r='9'},{s='S',r='T'},{s='S',r='J'},{s='S',r='Q'},{s='S',r='K'},{s='S',r='A'},},
            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
                {id = 'c_magician'},
                {id = 'c_empress'},
                {id = 'c_heirophant'},
                {id = 'c_chariot'},
                {id = 'c_devil'},
                {id = 'c_tower'},
                {id = 'c_lovers'},
                {id = 'c_incantation'},
                {id = 'c_grim'},
                {id = 'c_familiar'},
                {id = 'p_standard_normal_1', ids = {
                    'p_standard_normal_1','p_standard_normal_2','p_standard_normal_3','p_standard_normal_4','p_standard_jumbo_1','p_standard_jumbo_2','p_standard_mega_1','p_standard_mega_2',
                }},
                {id = 'j_marble'},
                {id = 'j_vampire'},
                {id = 'j_midas_mask'},
                {id = 'j_certificate'},
                {id = 'v_magic_trick'},
                {id = 'v_illusion'},
            },
            banned_tags = {
                {id = 'tag_standard'},
            },
            banned_other = {
            }
        }
    }
