    local jd_def = JokerDisplay.Definitions
    
    jd_def["j_MLP_MLPTwilight"] = { -- Twilight Sparkle
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        calc_function = function(card)
            local temp_Mult = 1
			local temp_ID = 0
			local raised_card = nil            
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                          for i=1, #scoring_hand do                
                            if temp_ID <= scoring_hand[i].base.id and scoring_hand[i].ability.effect ~= 'Stone Card' then 
							temp_ID = scoring_hand[i].base.nominal; raised_card = scoring_hand[i]
							end            
                        end
                    end
            card.joker_display_values.mult = (temp_ID) or 0
        end
    }

    jd_def["j_MLP_MLPRainbow"] = { -- Rainbow Dash
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
    }

    jd_def["j_MLP_MLPPinkie"] = { -- Pinkie Pie
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
        calc_function = function(card)
            local facecheck = 0
            local text, _, full_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then                        
			for i = 1, #full_hand do
				if full_hand[i]:is_face() then
					facecheck = facecheck + 1
				end
			end       
        end 
            card.joker_display_values.chips = (facecheck == 5) and card.ability.extra.chips or 0         
        end   
    }

    jd_def["j_MLP_MLPRarity"] = { -- Rarity
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.GOLD },
        calc_function = function(card)
            local temp_Mult = 1
			local temp_ID = 0
			local raised_card = nil            
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                          for i=1, #scoring_hand do                
                            if temp_ID <= scoring_hand[i].base.id and scoring_hand[i].ability.effect ~= 'Stone Card' then 
							temp_ID = scoring_hand[i].base.nominal; raised_card = scoring_hand[i]
							end            
                        end
                    end
            card.joker_display_values.dollars = math.ceil(temp_ID/2) or 0
        end
    }

    jd_def["j_MLP_MLPApplejack"] = { -- Applejack
        retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
            if held_in_hand then return 0 end
            local last_card = scoring_hand and JokerDisplay.calculate_rightmost_card(scoring_hand)
            local secondfromlast_card = scoring_hand and scoring_hand[#scoring_hand - 1]
            return ((last_card and playing_card == last_card) or (secondfromlast_card and playing_card == secondfromlast_card)) and
                joker_card.ability.extra.repetitions * JokerDisplay.calculate_joker_triggers(joker_card) or 0
        end
    }

    jd_def["j_MLP_MLPFluttershy"] = { -- Fluttershy
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
    }

    jd_def["j_MLP_MLPSpike"] = { -- Spike
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" }
        },    
        text_config = { colour = G.C.SECONDARY_SET.Tarot },        
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "MLPSpike_poker_hand", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            local text, _, _ = JokerDisplay.evaluate_hand()
            local is_MLPSpike_poker_hand = text == card.ability.extra.poker_hand
            card.joker_display_values.count = is_MLPSpike_poker_hand and 1 or 0
            card.joker_display_values.MLPSpike_poker_hand = localize(card.ability.extra.poker_hand, 'poker_hands')
        end
    }

    jd_def["j_MLP_MLPStarlight"] = { -- Starlight Glimmer
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "Xmult" }
                }
            }
        },
        calc_function = function(card)
			local playedcards = {}
		    local counts = {}
		    local hasdupes = false
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then                        
		for i=1, #scoring_hand do
		if SMODS.has_no_suit(scoring_hand[i]) then
			table.insert(playedcards, scoring_hand[i].ability.name)
		elseif SMODS.has_no_rank(scoring_hand[i]) then
			table.insert(playedcards, scoring_hand[i].base.suit..scoring_hand[i].ability.name)
		elseif SMODS.has_any_suit(scoring_hand[i]) then
			table.insert(playedcards, scoring_hand[i].base.id..scoring_hand[i].ability.name)
		else
			table.insert(playedcards, scoring_hand[i].base.id..scoring_hand[i].base.suit..scoring_hand[i].ability.name)
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
        end
            card.joker_display_values.Xmult = hasdupes and card.ability.extra.xmult or 1
        end   
    }

    jd_def["j_MLP_MLPTrixie"] = { -- Trixie

    }

    jd_def["j_MLP_MLPSunsetShimmer"] = { -- Sunset Shimmer
            reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "active" },
            { text = ")" },
        },
        calc_function = function(card)
            card.joker_display_values.active = (G.GAME and G.GAME.current_round.hands_played == 0 and localize("jdis_active") or localize("jdis_inactive"))
        end
    }    

    jd_def["j_MLP_MLPLyrabon"] = { -- Lyra and Bon Bon

    }

    jd_def["j_MLP_MLPMaud"] = { -- Maud Pie
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        calc_function = function(card)
            local playing_hand = next(G.play.cards)
            local count = 0
            for _, playing_card in ipairs(G.hand.cards) do
                if playing_hand or not playing_card.highlighted then
                    if not (playing_card.facing == 'back') and not playing_card.debuff and SMODS.has_enhancement(playing_card, "m_stone") then
                        count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    end
                end
            end
            card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
        end    
    }

    jd_def["j_MLP_MLPDiscord"] = { -- Discord
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "MLPDiscord_poker_hand", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            local text, _, _ = JokerDisplay.evaluate_hand()
            local is_MLPDiscord_poker_hand = text == card.ability.extra.poker_hand
            card.joker_display_values.x_mult = card.ability.extra.xmult or 1
            card.joker_display_values.MLPDiscord_poker_hand = localize(card.ability.extra.poker_hand, 'poker_hands')
        end    
    }

    jd_def["j_MLP_MLPBigMac"] = { -- Big McIntosh
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'eeyup')
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
        end
    }

    jd_def["j_MLP_MLPDerpy"] = { -- Derpy

    }

    jd_def["j_MLP_MLPZecora"] = { -- Zecora
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.SECONDARY_SET.Tarot },
        calc_function = function(card)
            local text, _, full_hand = JokerDisplay.evaluate_hand()
            card.joker_display_values.active = (#G.hand.highlighted == 4)
            card.joker_display_values.count = card.joker_display_values.active and 1 or 0
        end
    }    

    jd_def["j_MLP_MLPDJPON3"] = { -- DJ PON-3
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" },
        },
        text_config = { colour = G.C.CHIPS },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },
        calc_function = function(card)
            local chips = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() == G.GAME.current_round.MLPMUSIC_card.id then
                        chips = chips +
                            card.ability.extra.chips * JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.chips = chips
            card.joker_display_values.localized_text = G.GAME.current_round.MLPMUSIC_card.rank
        end
    }    

    jd_def["j_MLP_MLPOctavia"] = { -- Octavia Melody
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },
        calc_function = function(card)
            local mult = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() == G.GAME.current_round.MLPMUSIC_card.id then
                        mult = mult +
                            card.ability.extra.mult * JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.mult = mult
            card.joker_display_values.localized_text = G.GAME.current_round.MLPMUSIC_card.rank
        end
    }    

    jd_def["j_MLP_MLPCrystalHeart"] = { -- Crystal Heart
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" },
        },
        text_config = { colour = G.C.CHIPS },
        calc_function = function(card)
            local playing_hand = next(G.play.cards)
            local chips = 0
            for _, playing_card in ipairs(G.hand.cards) do
                if playing_hand or not playing_card.highlighted then
                    if playing_card.facing and not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:is_suit('Hearts') or playing_card:is_suit('Diamonds') then
                        chips = chips + card.ability.extra.chips * JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    end
                end
            end
            card.joker_display_values.chips = chips
        end
    }    

    jd_def["j_MLP_MLPSonicRainboom"] = { -- Sonic Rainboom
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        },
        extra = {
            { text = k_MLPrainboomwarning }
        },        
        extra_config = { colour = G.C.ORANGE, scale = 0.3 },        
    }    

    jd_def["j_MLP_MLPNapTime"] = { -- Nap Time
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },   
    }    

    jd_def["j_MLP_MLPDragonCode"] = { -- Dragon Code
            reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "active" },
            { text = ")" },
        },
        calc_function = function(card)
            card.joker_display_values.active = (not card.ability.extra.tarotmake and localize("jdis_active") or localize("jdis_inactive"))
        end
    }    

    jd_def["j_MLP_MLPLibraryCard"] = { -- Library Card
        text = {
                    { text = "+" },
                    { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "MLPLibraryCard_poker_hand", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            local text, _, _ = JokerDisplay.evaluate_hand()
            local is_MLPLibraryCard_poker_hand = text == card.ability.extra.lasthandtype
            card.joker_display_values.mult = card.ability.extra.mult or 0
            card.joker_display_values.MLPLibraryCard_poker_hand = card.ability.extra.lasthandtype
        end    
    }

    jd_def["j_MLP_MLPCoronationTwilight"] = { -- Coronation Twilight
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                }
            }
        },
    }

    jd_def["j_MLP_MLPWonderboltDash"] = { -- Wonderbolt Dash
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "Xmult" }
                }
            }
        },
        calc_function = function(card)
            card.joker_display_values.Xmult = 1 + ((G.GAME.current_round.hands_left - 1) * card.ability.extra.xmult)
        end                
    }

    jd_def["j_MLP_MLPPinkamena"] = { -- Pinkamena
        text = {
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
            { text = "x",                              scale = 0.35 },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult" }
                }
            },
            { text = " ",                              scale = 0.35 },                            
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
            { text = "x",                              scale = 0.35 },                
            { text = "-$",                             colour = G.C.GOLD },          
            { ref_table = "card.joker_display_values", ref_value = "dollars", colour = G.C.GOLD },  
        },
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "scoreodds" },
                { text = ") " },
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "moneyodds" },
                { text = ")" },                
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },

        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_face() then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.count = count
            card.joker_display_values.dollars = card.ability.extra.dollars
            local snumerator, sdenominator = SMODS.get_probability_vars(card, 1, card.ability.extra.scoreodds, 'cupcakes')
            local mnumerator, mdenominator = SMODS.get_probability_vars(card, 1, card.ability.extra.moneyodds, 'theyreabunchalosers')            
            card.joker_display_values.scoreodds = localize { type = 'variable', key = "jdis_odds", vars = { snumerator, sdenominator } }
            card.joker_display_values.moneyodds = localize { type = 'variable', key = "jdis_odds", vars = { mnumerator, mdenominator } }            
        end
    }

    jd_def["j_MLP_MLPPlainity"] = { -- Plainity
            text = {
            { text = "+",                              colour = G.C.CHIPS },
            { ref_table = "card.joker_display_values", ref_value = "chips", colour = G.C.CHIPS, retrigger_type = "mult" },
            { text = " +",                             colour = G.C.MULT },
            { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
        },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" }
        },
        calc_function = function(card)
            local chips, mult = 0, 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if SMODS.has_enhancement(scoring_card, "c_base") and not scoring_card.edition and not scoring_card.seal then
                        local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        chips = chips + card.ability.extra.chips * retriggers
                        mult = mult + card.ability.extra.mult * retriggers
                    end
                end
            end
            card.joker_display_values.mult = mult
            card.joker_display_values.chips = chips
            card.joker_display_values.localized_text = "(" .. localize("k_MLPunmodified") .. ")"
        end
    }

    jd_def["j_MLP_MLPAppleJewel"] = { -- Apple Jewel
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text_other", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            local notjacks = true
            if text ~= 'Unknown' then
			notjacks = false
                for _, scoring_card in pairs(scoring_hand) do
				if scoring_card:get_id() and scoring_card:get_id() ~= 11 then
		notjacks = true
				end
			end		
		end

            card.joker_display_values.x_mult = not notjacks and card.ability.extra.xmult or 1
            card.joker_display_values.localized_text_other = localize('k_MLPalljacks')
        end
    }

    jd_def["j_MLP_MLPFlutterbat"] = { -- Flutterbat
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            card.joker_display_values.dollars = card.ability.extra.dollars
            card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        end
    }    

    jd_def["j_MLP_MLPDaringDo"] = { -- Daring Do
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "Xmult" }
                }
            }
        },
        calc_function = function(card)
            card.joker_display_values.Xmult = G.GAME.current_round.discards_used == 0 and (1 + (G.GAME.current_round.discards_left * card.ability.extra.xmult)) or 1
        end                
    }    
    jd_def["j_MLP_MLPElements"] = { -- Elements of Harmony
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "Xmult" }
                }
            }
        },
        calc_function = function(card)
            card.joker_display_values.Xmult = (#G.jokers.cards > card.ability.extra.jokers) and (card.ability.extra.xmult) or 1
        end                
    }        

    jd_def["j_MLP_MLPAppleBloom"] = { -- Apple Bloom
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
			if #scoring_hand > 1 and scoring_hand[#scoring_hand]:get_id() == scoring_hand[#scoring_hand - 1]:get_id() then
				if scoring_card == scoring_hand[#scoring_hand] or scoring_card == scoring_hand[#scoring_hand - 1] then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    end
                end
            end
            card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
            card.joker_display_values.localized_text = localize("k_MLPlasttwo")
        end
    }

    jd_def["j_MLP_MLPSweetieBelle"] = { -- Sweetie Belle
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
    }    

    jd_def["j_MLP_MLPScootaloo"] = { -- Scootaloo
        text = {
            { text = "+$" },
            { ref_table = "card.ability.extra", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        },
        calc_function = function(card)
            card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
        end
    }        

    jd_def["j_MLP_MLPGabby"] = { -- Gabby
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
    }    

    
    jd_def["j_MLP_MLPBabsSeed"] = { -- Babs Seed
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
    }            

    jd_def["j_MLP_MLPDrHooves"] = { -- Dr. Hooves
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        calc_function = function(card)
            card.joker_display_values.mult = (card.ability.extra.mult*(G.GAME.round_resets.ante - 1)) or 0 
        end
    }            

    jd_def["j_MLP_MLPMuralCompetition"] = { -- Mural of Competition
        reminder_text = {
            { text = "(6,7,8,9,10)" },
        },
        retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
            if held_in_hand then return 0 end
            return (playing_card:get_id() == 6 or playing_card:get_id() == 7 or playing_card:get_id() == 8 or playing_card:get_id() == 9 or playing_card:get_id() == 10) and
                joker_card.ability.extra.repetitions * JokerDisplay.calculate_joker_triggers(joker_card) or 0
        end
    }                
    
    jd_def["j_MLP_MLPMuralFriendship"] = { -- Mural of Friendship
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
    }        

    jd_def["j_MLP_MLPMuralCompassion"] = { -- Mural of Compassion
        text = {
            { text = "+$" },
            { ref_table = "card.joker_display_values", ref_value = "dollars", retrigger_type = "mult" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { text = "(6,7,8,9,10)" },
        },
        calc_function = function(card)
            local dollars = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if (scoring_card:get_id() == 6 or scoring_card:get_id() == 7 or scoring_card:get_id() == 8 or scoring_card:get_id() == 9 or scoring_card:get_id() == 10) then
                        dollars = dollars +
                            card.ability.extra.dollars * JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.dollars = dollars
        end
    }            

    jd_def["j_MLP_MLPCelestia"] = { -- Princess Celestia
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
    }                

    jd_def["j_MLP_MLPLuna"] = { -- Princess Luna
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
    }     

    jd_def["j_MLP_MLPCadance"] = { -- Princess Cadance
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        calc_function = function(card)
            local playing_hand = next(G.play.cards)
            local count = 0
            for _, playing_card in ipairs(G.hand.cards) do
                if playing_hand or not playing_card.highlighted then
                    if not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:is_suit('Hearts') or playing_card:is_suit('Diamonds') then
                        count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    end
                end
            end
            card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
        end    
    }

    jd_def["j_MLP_MLPTirek"] = { -- Lord Tirek
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
    }     

    jd_def["j_MLP_MLPChrysalis"] = { -- Queen Chrysalis
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
    }         

    jd_def["j_MLP_MLPCozyGlow"] = { -- Cozy Glow
            reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "active" },
            { text = ")" },
        },
        calc_function = function(card)
            card.joker_display_values.active = (G.GAME and G.GAME.current_round.hands_played == 0 and localize("jdis_active") or localize("jdis_inactive"))
        end
    }        

    jd_def["j_MLP_MLPSombra"] = { -- King Sombra
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
    }      
    
    jd_def["j_MLP_MLPSpitfire"] = { -- Spitfire
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'academyrecord')
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
        end
    }          

    jd_def["j_MLP_MLPFlowerGirls"] = { -- Flower Girls
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" }
        },
        calc_function = function(card)        
        card.joker_display_values.localized_text = localize("jdis_all_suits")        
        end
    }    

    jd_def["j_MLP_MLPSunburst"] = { -- Sunburst
        text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        },
        reminder_text = {
            { text = "(" },
            { text = "Blue, ", ref_value = "localized_text", colour = G.C.BLUE },
            { text = "Purple", ref_value = "localized_text", colour = G.C.PURPLE },            
            { text = ")" }
        },        
        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card.seal == 'Blue' or scoring_card.seal == 'Purple' then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.count = count
        end
    }    

    jd_def["j_MLP_MLPPartyCannon"] = { -- Party Cannon
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "MLPPartyCannon_poker_hand", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            local text, _, _ = JokerDisplay.evaluate_hand()
            local is_MLPPartyCannon_poker_hand = text == card.ability.extra.poker_hand
            card.joker_display_values.x_mult = card.ability.extra.xmult or 0
            card.joker_display_values.MLPPartyCannon_poker_hand = localize(card.ability.extra.poker_hand, 'poker_hands')
        end    
    }    

    jd_def["j_MLP_MLPCheerilee"] = { -- Cheerilee
        reminder_text = {
            { text = "(2,3,4,5)" },
        },
    }        

    jd_def["j_MLP_MLPAutumnBlaze"] = { -- Autumn Blaze

    }            

    jd_def["j_MLP_MLPZapAppleJam"] = { -- Zap Apple Jam

    }                

    jd_def["j_MLP_MLPGilda"] = { -- Gilda
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "($", colour = G.C.GOLD },
            { ref_table = "card.ability.extra", ref_value = "money_spent", retrigger_type = "mult", colour = G.C.GOLD },
            { text = ")", colour = G.C.GOLD },            
        },
        extra_config = { colour = G.C.GOLD },        
    }    

    jd_def["j_MLP_MLPFriendshipLesson"] = { -- Friendship Lesson
        text = {
            { ref_table = "card.joker_display_values", ref_value = "MLPFriendshipLesson_poker_hand", colour = G.C.ORANGE },
        },    
        text_config = { colour = G.C.SECONDARY_SET.Tarot },        
            reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "active" },
            { text = ")" },
        },
        calc_function = function(card)
            card.joker_display_values.MLPFriendshipLesson_poker_hand = localize(card.ability.extra.poker_hand, 'poker_hands')
            card.joker_display_values.active = (not card.ability.extra.learned and localize("jdis_active") or localize("jdis_inactive"))            
        end
    }    

    jd_def["j_MLP_MLPFATwilight"] = { -- Fanfic Author Twilight
        text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS },
    }    

    jd_def["j_MLP_MLPFIBenefits"] = { -- Friendship is Benefits
        text = {
            { text = "+$" },
            { ref_table = "card.ability.extra", ref_value = "dollars" },
        },
        text_config = { colour = G.C.GOLD },
        reminder_text = {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
            { text = ")" },
        },
        calc_function = function(card)
            card.joker_display_values.localized_text = localize('Straight', 'poker_hands')
        end
    }    

    jd_def["j_MLP_MLPShiningArmor"] = { -- Shining Armor
        text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                }
            }
        },
        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if SMODS.has_enhancement(scoring_card, "m_steel") then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
        end
    }        




