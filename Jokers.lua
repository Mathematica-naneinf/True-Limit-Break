





-- Test Joker

SMODS.Joker {
	key = "test",
	atlas = "TLB_Jokers",
	pos = {
		x = 0, 
		y = 0
	},
	config = {
		extra = {
			
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 1,
	cost = 3,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				
			}
		}
	end,
	
	calculate = function(self, card, context)
		
	end
}


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
			mult_gain = 0.5,
			chip_gain = 2
		},
	},
	unlocked = true,
	discovered = true,
	rarity = "cry_epic",
	cost = 3,
	
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.chips,
				card.ability.extra.mult_gain,
				card.ability.extra.chip_gain
			}
		}
	end,
	
	calculate = function(self, card, context)
		if context.discard and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
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
			


			-- Check for at least 3 scoring clubs
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
