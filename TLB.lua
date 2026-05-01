-- Joker Atlas (Joker Sprites)

SMODS.Atlas {
	key = "TLB_Jokers",
	px = 71,
	py = 95,
	path = "TLB_Jokers.png"
}


-- Back Atlas (Deck Sprites)

SMODS.Atlas {
	key = "TLB_Backs",
	px = 71,
	py = 95,
	path = "TLB_Backs.png"
}


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
			score = 20
		},
	},
	unlocked = true,
	discovered = true,
	rarity = 1,
	cost = 3,
	
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
			levels = 0.2
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




-- Test Deck

SMODS.Back {
	key = "test",
	atlas = "TLB_Backs",
	pos = {
		x = 0,
		y = 0
	},
	unlocked = "true",
	discovered = "true",
	
	
	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					
					-- Create a "Joker" with key "j_TLB_test"
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_TLB_test", nil)
					
					-- Place that Joker in the Joker slots
					G.jokers:emplace(card)
					
					-- Tell the game the function has finished running
					return true
				end
			end,
		}))
	end,
	
}
