
SMODS.Challenge{ -- Chaos Dimension
        key = 'MLPChaos',
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
                {id = 'joker_slots', value = 3},
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
--[[             banned_cards = {
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
				
            }, ]]
            banned_other = {
            }
        }
    }

SMODS.Challenge{ -- Chillaxing
        key = 'MLPChillaxing',
        rules = {
            custom = {

            },
            modifiers = {
                -- {id = 'dollars', value = 6},
                -- {id = 'discards', value = 3},
                {id = 'hands', value = 6},
                -- {id = 'reroll_cost', value = 5},
                -- {id = 'joker_slots', value = 3},
                -- {id = 'consumable_slots', value = 2},
                {id = 'hand_size', value = 5},
            }
        },
        jokers = {
            {id = 'j_MLP_MLPNapTime'},
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
--[[             banned_cards = {
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
				
            }, ]]
            banned_other = {
            }
        }
    }

SMODS.Challenge{ -- Spike At Your Service
        key = 'MLPSpikeAtYourService',
        rules = {
            custom = {
                -- {id = 'no_reward'},
                -- {id = 'no_extra_hand_money'},
                -- {id = 'no_interest'},
                -- {id = 'no_shop_jokers'},
                {id = 'MLPnotarot'},
            },
            modifiers = {
                -- {id = 'dollars', value = 6},
                -- {id = 'discards', value = 3},
                -- {id = 'hands', value = 4},
                -- {id = 'reroll_cost', value = 5},
                -- {id = 'joker_slots', value = 3},
                -- {id = 'consumable_slots', value = 2},
                -- {id = 'hand_size', value = 8},
            }
        },
        jokers = {
            {id = 'j_MLP_MLPSpike', eternal = true},
			{id = 'j_MLP_MLPDragonCode', eternal = true},
			{id = 'j_MLP_MLPApplejack'},
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
--[[                 {id = 'c_chariot'},
                {id = 'c_death'},
                {id = 'c_devil'},
                {id = 'c_emperor'},
                {id = 'c_empress'},				
                {id = 'c_fool'},
                {id = 'c_hanged_man'},
                {id = 'c_heirophant'},
                {id = 'c_hermit'},
                {id = 'c_high_priestess'},				
                {id = 'c_judgement'},
                {id = 'c_justice'},
                {id = 'c_lovers'},
                {id = 'c_magician'},
                {id = 'c_moon'},				
                {id = 'c_star'},
                {id = 'c_strength'},
                {id = 'c_sun'},
                {id = 'c_temperance'},
                {id = 'c_tower'},	
                {id = 'c_wheel_of_fortune'},
                {id = 'c_world'},				
 ]]
			{
				id = "p_arcana_normal_1",
				ids = {
					"p_arcana_normal_1",
					"p_arcana_normal_2",
					"p_arcana_normal_3",
					"p_arcana_normal_4",
					"p_arcana_jumbo_1",
					"p_arcana_jumbo_2",
					"p_arcana_mega_1",
					"p_arcana_mega_2",
				},
			},
				
                {id = 'v_tarot_merchant'},
                {id = 'v_tarot_tycoon'},
				
                {id = 'j_8_ball'},
                {id = 'j_superposition'},
                {id = 'j_vagabond'},
                {id = 'j_hallucination'},
                {id = 'j_cartomancer'},             
            },
            banned_tags = {
                {id = 'tag_charm'},
				
            },
            banned_other = {
            }
        }
    }

local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.modifiers.MLPnotarot = nil
    ret.modifiers.MLPdoubleblind = nil
    ret.modifiers.MLP4select = nil
	return ret
end

local gsr = Game.start_run
function Game:start_run(args)
	gsr(self, args)
	if G.GAME.modifiers.MLPnotarot then
		G.GAME.tarot_rate = 0
	end
    if G.GAME.modifiers.MLPdoubleblind then
        G.GAME.starting_params.ante_scaling = 2
    end
    if G.GAME.modifiers.MLPhalfblind then
        G.GAME.starting_params.ante_scaling = 0.5
    end    
    if G.GAME.modifiers.MLP4select then
        G.hand.config.highlighted_limit = 4
--[[         SMODS.change_play_limit(-1)
        SMODS.change_discard_limit(-1) ]]
    end
end

SMODS.Challenge{ -- Teacup!
        key = 'MLPTeacup',
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
--[[                 {id = 'c_magician'},
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
                {id = 'v_illusion'}, ]]
            },
            banned_tags = {
--[[                 {id = 'tag_standard'}, ]]
            },
            banned_other = {
            }
        }
    }

    SMODS.Challenge{ -- Slice of Life
        key = 'MLPSliceofLife',
        rules = {
            custom = {
                -- {id = 'no_reward'},
                -- {id = 'no_extra_hand_money'},
                -- {id = 'no_interest'},
                -- {id = 'no_shop_jokers'},
                {id = 'MLPhalfblind'},
                {id = 'MLPcommononly'},                
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
        },
        consumeables = {
        },
        vouchers = {
        },
         deck = {

            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
                {id = 'c_soul'},                
                {id = 'c_wraith'},                        
--[[                 {id = 'c_magician'},
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
                {id = 'v_illusion'}, ]]
            },
            banned_tags = {
                 {id = 'tag_uncommon'}, 
                 {id = 'tag_rare'},                  
            },
            banned_other = {
            }
        }
    }


    SMODS.Challenge{ -- Shipfic Folder
        key = 'MLPShipficFolder',
        rules = {
            custom = {
                -- {id = 'no_reward'},
                -- {id = 'no_extra_hand_money'},
                -- {id = 'no_interest'},
                -- {id = 'no_shop_jokers'},
                {id = 'MLP4select'},                
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
            {id = 'j_MLP_MLPFATwilight'},
        },
        consumeables = {
        },
        vouchers = {
        },
         deck = {

            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
--[[                 {id = 'c_magician'},
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
                {id = 'v_illusion'}, ]]
            },
            banned_tags = {
--[[                 {id = 'tag_standard'}, ]]
            },
            banned_other = {
                    { id = 'bl_psychic', type = 'blind' },
            }
        }
    }

SMODS.Challenge{ -- Legion of Doom
        key = 'MLPLegionofDoom',
        rules = {
            custom = {
                -- {id = 'no_reward'},
                -- {id = 'no_extra_hand_money'},
                -- {id = 'no_interest'},
                -- {id = 'no_shop_jokers'},
                {id = 'MLPdoubleblind'},
            },
            modifiers = {
                -- {id = 'dollars', value = 6},
                -- {id = 'discards', value = 3},
                -- {id = 'hands', value = 4},
                -- {id = 'reroll_cost', value = 5},
                 {id = 'joker_slots', value = 6},
                -- {id = 'consumable_slots', value = 2},
                -- {id = 'hand_size', value = 8},
            }
        },
        jokers = {
            {id = 'j_MLP_MLPChrysalis', eternal = true},
            {id = 'j_MLP_MLPTirek', eternal = true},
            {id = 'j_MLP_MLPCozyGlow', eternal = true},
        },
        consumeables = {
        },
        vouchers = {
        },
         deck = {

            type = 'Challenge Deck'
        },
        restrictions = {
            banned_cards = {
--[[                 {id = 'c_magician'},
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
                {id = 'v_illusion'}, ]]
            },
            banned_tags = {
--[[                 {id = 'tag_standard'}, ]]
            },
            banned_other = {
            }
        }
    }
