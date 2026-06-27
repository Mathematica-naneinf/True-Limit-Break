






-- Backs

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
	
	
	-- This mess down here was originally copied from Cryptid's code and edited with only the information I could get from the error messages when I broke it. I'm pretty sure I (mostly) understand it now, though.
	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					
					-- Create a "Joker" with key "j_TLB_test".
					local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_TLB_test", nil)
					
					-- Place that Joker in the Joker slots.
					G.jokers:emplace(card)
					
					-- Tell the game the function has finished running so it doesn't contine to run every frame forever (I totally didn't mess this up twice).
					return true
				end
			end,
		}))
	end,
	
}
