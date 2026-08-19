








-- Early Bird

SMODS.Joker {
	key = "early",
	atlas = "TLB_Jokers",
	pos = {
		x = 1,
		y = 0
	},
	config = {
		extra = {
			xmult = 3,
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 1,
	cost = 3,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.initial_scoring_step then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}


-- Geometry Dash

SMODS.Joker {
	key = "dash",
	atlas = "TLB_Jokers",
	pos = {
		x = 2, 
		y = 0
	},
	config = {
		extra = {
			numerator = 1,
			denominator = 7,
			xmult = 2.2
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 2,
	pools = {
		["Meme"] = true,
		["Reference"] = true
	},
	cost = 5,
	
	loc_vars = function(self, info_queue, card)
		local num, denom = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator)
		return {
			vars = {
				num,
				denom,
				card.ability.extra.xmult
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and SMODS.pseudorandom_probability(card, "Scope Creep", card.ability.extra.numerator, card.ability.extra.denominator) then
			return {
				xmult = card.ability.extra.xmult
			}
		end
	end
}


-- Paper Shredder

SMODS.Joker {
	key = "shred",
	atlas = "TLB_Jokers",
	pos = {
		x = 3, 
		y = 0
	},
	config = {
		extra = {
			mult = 0,
			chips = 0,
			mult_increase = 0.5,
			chips_increase = 2
		},
	},
	unlocked = true,
	discovered = true,
	rarity = "cry_epic",
	cost = 12,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.chips,
				card.ability.extra.mult_increase,
				card.ability.extra.chips_increase
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.discard and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_increase
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_increase
			return {
				remove = true
			}
		end
		
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips
			}
		end
	end
}


-- The Ol' Switcheroo

SMODS.Joker {
	key = "switch",
	atlas = "TLB_Jokers",
	pos = {
		x = 4, 
		y = 0
	},
	config = {
		extra = {
			dollars = 1
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 3,
	pools = {
		["Meme"] = true,
	},
	cost = 7,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.dollars
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.individual and context.cardarea == "unscored" then
			return {
				dollars = card.ability.extra.dollars,
				swap = true
			}
		end
		
	end
}


-- Alien's Rock

SMODS.Joker {
	key = "alien",
	atlas = "TLB_Jokers",
	pos = {
		x = 5, 
		y = 0
	},
	config = {
		extra = {
			levels = 0.3
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 3,
	cost = 7,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.levels
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.before then
			
			-- Define a temporary table called "handtab"
			local handtab = {}
			
			-- Iterate through every hand in the game
			for k, v in pairs(G.GAME.hands) do
				
				-- Check if the hand is contained within the played hand
				if next(context.poker_hands[k]) then
					
					-- Add the hand to the temporary "handtab" table
					table.insert(handtab, k)
				end
			end
			SMODS.upgrade_poker_hands{
			level_up = card.ability.extra.levels,

			-- Upgrade every hand in the temporary "handtab" table
			hands = handtab
			}
		end
	end
}


-- Rewrite

SMODS.Joker {
	key = "rewrite",
	atlas = "TLB_Jokers",
	pos = {
		x = 6, 
		y = 0
	},
	config = {
		extra = {
			score = 30
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 1,
	cost = 4,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.score
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.individual and context.cardarea == "unscored" then
			return {
				score = card.ability.extra.score
			}
		end
	end
}


-- Big Hands (Second effect in hooks)

SMODS.Joker {
	key = "hhaanndd",
	atlas = "TLB_Jokers",
	pos = {
		x = 7, 
		y = 0
	},
	config = {
		extra = {
			hand_size = 5
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 3,
	pools = {
		["Meme"] = true,
	},
	cost = 9,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hand_size
			}
		}
	end,
	
	add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.hand_size)
	end,
	
	remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(-card.ability.extra.hand_size)
	end
}


-- Left Redistributor

SMODS.Joker {
	key = "left_redist",
	atlas = "TLB_Jokers",
	pos = {
		x = 8, 
		y = 0
	},
	config = {
		extra = {
			xchips = 3,
			xmult = 0.5
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 1,
	cost = 4,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xchips,
				card.ability.extra.xmult
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips,
				xmult = card.ability.extra.xmult,
				remove_default_message = true,
				message = 'Redistributed!',
            			colour = G.C.PURPLE
			}
		end
	end
}


-- Right Redistributor

SMODS.Joker {
	key = "right_redist",
	atlas = "TLB_Jokers",
	pos = {
		x = 9, 
		y = 0
	},
	config = {
		extra = {
			xchips = 0.5,
			xmult = 3
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 1,
	cost = 4,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xchips,
				card.ability.extra.xmult
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips,
				xmult = card.ability.extra.xmult,
				remove_default_message = true,
				message = 'Redistributed!',
            			colour = G.C.PURPLE
			}
		end
	end
}


-- Join The Club!

SMODS.Joker {
	key = "clover",
	atlas = "TLB_Jokers",
	pos = {
		x = 0, 
		y = 1
	},
	config = {
		extra = {
			
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 3,
	pools = {
		["reference"] = true,
	},
	cost = 7,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.after and not context.blueprint then

			-- Define a temporary variable to store the number of scoring Clubs
			local scoring_clubs = 0


			-- Iterate through every scoring card to check how many of them are Clubs
			for i, v in pairs(context.scoring_hand) do
				if v:is_suit("Clubs") then
					scoring_clubs = scoring_clubs + 1
				end
			end
			


			-- Check for at least three scoring clubs
			if scoring_clubs > 2 then


				-- Iterate through every played card
				for i, v in pairs(context.full_hand) do

					-- Change the card's suit to Clubs
					assert(SMODS.change_base(v, "Clubs", nil, true))

					-- Ensure this change happens at the right time
					G.E_MANAGER:add_event(Event({
						func = function()
							v:set_sprites(nil, v.config.card)
							return true
						end
					}))
				end
			end
		end
	end
}


-- Rude Buster

SMODS.Joker {
	key = "rude",
	atlas = "TLB_Jokers",
	pos = {
		x = 1,
		y = 1
	},
	config = {
		extra = {
			damage = 300,
			damage_increase = 50,
			quote = "\"Don't expect me to do anything but fight.\"",
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 3,
	pools = {
		["Reference"] = true,
		["Delta"] = true
	},
	cost = 8,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.damage,
				card.ability.extra.damage_increase,
				card.ability.extra.quote,
				colours = {
					HEX("FF2CF9")
				}
			}
		}
	end,
	
	calculate = function (self, card, context)
		if context.before then
			return {
				blindsize = -card.ability.extra.damage,
				remove_default_message = true,
				message = card.ability.extra.damage .. " Damage!",
				colour = HEX("FF2CF9")
			}
		end
		
		if context.end_of_round and context.beat_boss and context.main_eval then
			card.ability.extra.damage = card.ability.extra.damage + card.ability.extra.damage_increase
		end
	end
}


-- Heal Prayer

SMODS.Joker {
	key = "heal",
	atlas = "TLB_Jokers",
	pos = {
		x = 2,
		y = 1
	},
	config = {
		extra = {
			hands = 1,
			activation_discards = 2,
			discards = 0,
			quote = "\"I'll protect everyone!\""
		}
	},
	unlocked = true,
	discovered = true,
	rarity = 2,
	pools = {
		["Reference"] = true,
		["Delta"] = true
	},
	cost = 5,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.hands,
				card.ability.extra.activation_discards,
				card.ability.extra.discards,
				card.ability.extra.quote
			}
		}
	end,
	
	calculate = function (self, card, context)
		if context.pre_discard then
			card.ability.extra.discards = card.ability.extra.discards + 1
			if card.ability.extra.discards >= card.ability.extra.activation_discards then
				card.ability.extra.discards = 0
				return {
					ease_hands_played(card.ability.extra.hands)
				}
			end
		end
	end
}


-- Iceshock

SMODS.Joker {
	key = "ice",
	atlas = "TLB_Jokers",
	pos = {
		x = 3,
		y = 1
	},
	config = {
		extra = {
			damage = 150,
			damage_increase = 5,
			transform = 35,
			activations = 0,
		}
	},
	unlocked = true,
	discovered = true,
	rarity = "cry_epic",
	pools = {
		["Reference"] = true,
		["Delta"] = true
	},
	cost = 10,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.damage,
				card.ability.extra.damage_increase,
				card.ability.extra.transform,
				card.ability.extra.transform - card.ability.extra.activations,
				colours = {
					HEX("FFF120"),
					HEX("0293FD")
				}
			}
		}
	end,
	
	calculate = function (self, card, context)
		if context.before then
			return {
				blindsize = -card.ability.extra.damage,
				remove_default_message = true,
				message = card.ability.extra.damage .. " Damage!",
				colour = HEX("FFF120")
			}
		end
		
		if context.initial_scoring_step then
			card.ability.extra.damage = card.ability.extra.damage + card.ability.extra.damage_increase
			card.ability.extra.activations = card.ability.extra.activations + 1
			
			if card.ability.extra.activations >= card.ability.extra.transform then
				G.E_MANAGER:add_event(Event({
					func = function()
						if G.jokers then
							
							-- Destroy this Joker
							G.jokers:remove_card(card)
							card:remove()
							card = nil
							
							-- Create a "joker" with key "j_TLB_grave"
							SMODS.add_card{
								set = "joker",
								key = "j_TLB_grave"
							}
							
							-- Tell the game the function has finished running so it doesn't contine to run every frame forever.
							return true
						end
					end,
				}))

			end
		end

	end
}


-- X-Slash

SMODS.Joker {
	key = "slash",
	atlas = "TLB_Jokers",
	pos = {
		x = 4,
		y = 1
	},
	config = {
		extra = {
			damage = 250,
			quote = "\"...\""
		}
	},
	unlocked = true,
	discovered = true,
	rarity = 3,
	pools = {
		["Reference"] = true,
		["Delta"] = true
	},
	cost = 8,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.damage,
				card.ability.extra.quote,
				colours = {
					HEX("26E9FF")
				}
			}
		}
	end,
	
	calculate = function (self, card, context)
		if context.before then
			return {
				blindsize = -card.ability.extra.damage,
				remove_default_message = true,
				message = card.ability.extra.damage .. " Damage!",
				colour = HEX("26E9FF")
			}
		end
		
		if context.initial_scoring_step then
			return {
				blindsize = -card.ability.extra.damage,
				remove_default_message = true,
				message = card.ability.extra.damage .. " Damage!",
				colour = HEX("26E9FF")
			}
		end
	end
}


-- SNOWGRAVE

SMODS.Joker {
	key = "grave",
	atlas = "TLB_Jokers",
	pos = {
		x = 5, 
		y = 1
	},
	config = {
		extra = {
			damage = 3000,
			damage_increase = 200,
			frost = 2,
			frost_multiplier = 1.1
		},
	},
	unlocked = true,
	discovered = true,
	rarity = "cry_exotic",
	cost = 35,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.damage,
				card.ability.extra.damage_increase,
				card.ability.extra.frost,
				card.ability.extra.frost_multiplier,
				colours = {
					HEX("FFF120"),
					HEX("0293FD"),
					HEX("77E0FF"),
				}
			}
		}
	end,
	
	
	
	calculate = function(self, card, context)
		if context.before then
			return {
				xblindsize = 1/card.ability.extra.frost,
				remove_default_message = true,
				message = "What... Happened?",
				colour = HEX("FFF120")
			}
		end
		
		if context.initial_scoring_step then
			card.ability.extra.damage = card.ability.extra.damage + card.ability.extra.damage_increase
			return {
				blindsize = -card.ability.extra.damage,
				remove_default_message = true,
				message = "There was so much snow, I couldn't see anything...",
				colour = HEX("FFF120")
			}

							
		end
		
		if context.after then
			
			-- Iterate through every played card
			for i, v in pairs(context.full_hand) do
				
				
			end

		end
		
		if context.end_of_round and context.beat_boss and context.main_eval then
			card.ability.extra.frost = card.ability.extra.frost * card.ability.extra.frost_multiplier
		end

	end
}


-- Permafrost

SMODS.Joker {
	key = "frost",
	atlas = "TLB_Jokers",
	pos = {
		x = 6,
		y = 1
	},
	config = {
		extra = {
			damage = 600,
			damage_increase = 10,
		}
	},
	unlocked = true,
	discovered = true,
	rarity = "cry_epic",
	pools = {
		["Reference"] = true
	},
	cost = 10,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.damage,
				card.ability.extra.damage_increase,
				colours = {
					HEX("77E0FF")
				}
			}
		}
	end,
	
	calculate = function (self, card, context)
		
		if context.press_play then
			
			card.ability.extra.damage = card.ability.extra.damage + card.ability.extra.damage_increase
			
			return {
				blindsize = -card.ability.extra.damage,
				remove_default_message = true,
				message = card.ability.extra.damage .. " Damage!",
				colour = HEX("77E0FF")
			}
		end
		
		if context.before then
			
			card.ability.extra.damage = card.ability.extra.damage + card.ability.extra.damage_increase
			
			return {
				blindsize = -card.ability.extra.damage,
				remove_default_message = true,
				message = card.ability.extra.damage .. " Damage!",
				colour = HEX("77E0FF")
			}
		end
		
		if context.initial_scoring_step then
			card.ability.extra.damage = card.ability.extra.damage + card.ability.extra.damage_increase
			
			return {
				blindsize = -card.ability.extra.damage,
				remove_default_message = true,
				message = card.ability.extra.damage .. " Damage!",
				colour = HEX("77E0FF")
			}
		end

	end
}


-- Photocopier

SMODS.Joker {
	key = "photocopy",
	atlas = "TLB_Jokers",
	pos = {
		x = 7,
		y = 1
	},
	config = {
		extra = {
			
		}
	},
	unlocked = true,
	discovered = true,
	rarity = 2,
	cost = 6,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.before then
			for i, v in pairs(context.scoring_hand) do
				SMODS.add_card {
				set = "Base",
				area = G.hand,
				rank = v.base.value,
				suit = v.base.suit
				}
			end
		end
	end
}


-- Orange Joker

SMODS.Joker {
	key = "orange",
	atlas = "TLB_Jokers",
	pos = {
		x = 8,
		y = 1
	},
	config = {
		extra = {
			chips = 0,
			chips_increase = 20,
			chips_decrease = 15
		}
	},
	unlocked = true,
	discovered = true,
	rarity = 1,
	cost = 3,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.chips_increase,
				card.ability.extra.chips_decrease
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
		
		if context.initial_scoring_step then
			if card.ability.extra.chips > 0 then
				card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_decrease
				
				if card.ability.extra.chips < 0 then
					card.ability.extra.chips = 0
					return {
					message = "0",
					colour = G.C.CHIPS
					}
				else
					return {
					message = "-" .. card.ability.extra.chips_decrease,
					colour = G.C.CHIPS
					}
				end
			end
		end
		
		if context.pre_discard then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_increase
			return {
				message = "+" .. card.ability.extra.chips_increase,
				colour = G.C.CHIPS
			}
		end
	end
}


-- Retro Joker

SMODS.Joker {
	key = "retro",
	atlas = "TLB_Jokers",
	pos = {
		x = 9,
		y = 1
	},
	config = {
		extra = {
			chips = 0,
			chips_increase = 50,
			mult = 0,
			mult_increase = 4
		}
	},
	unlocked = true,
	discovered = true,
	rarity = 2,
	cost = 6,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.chips_increase,
				card.ability.extra.mult,
				card.ability.extra.mult_increase
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
				mult = card.ability.extra.mult
			}
		end
		
		if context.skip_blind then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_increase
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_increase
			return {
				message = "Upgraded!",
				colour = G.C.PURPLE
			}
		end
	end
}


-- Rook

SMODS.Joker {
	key = "rook",
	atlas = "TLB_Jokers",
	pos = {
		x = 0,
		y = 2
	},
	config = {
		extra = {
			chips = 5,
			chips_increase = 5,
			last_rank = "Ace",
			last_suit = "Spades"
		}
	},
	unlocked = true,
	discovered = true,
	rarity = 2,
	cost = 5,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chips,
				card.ability.extra.chips_increase,
				card.ability.extra.last_rank,
				card.ability.extra.last_suit
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
		
		if context.individual and context.cardarea == G.play then
			
			if context.other_card.base.value == card.ability.extra.last_rank then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_increase
				card.ability.extra.last_rank = context.other_card.base.value
				return {
				message = "Upgraded!",
				colour = G.C.CHIPS
				}
			end
			
			if context.other_card.base.suit == card.ability.extra.last_suit then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_increase
				card.ability.extra.last_suit = context.other_card.base.suit
				return {
				message = "Upgraded!",
				colour = G.C.CHIPS
				}
			end
			
		end
	end
}








































