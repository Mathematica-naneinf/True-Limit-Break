






-- Knight

SMODS.Blind {
	key = "knight",
	atlas = "TLB_Blinds",
	config = {
		extra = {
			slash = 0.5
		}
	},
	discovered = true,
	dollars = 6,
	mult = 2.5,
	boss = {
		min = 3
	},
	boss_colour = HEX("552222"),
	vars = {
		2
	},
	
	loc_vars = function(self)
		return {
			vars = {
				1/self.config.extra.slash
			}
		}
	end,
	
	calculate = function(self, blind, context)
		if context.main_scoring then
			return {
				xmult = self.config.extra.slash,
				xscore = self.config.extra.slash,
				remove_default_message = true,
				message = "Slash!",
				colour = HEX("550000")
			}
		end
	end
}




































