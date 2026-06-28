







-- Synergy Deck

SMODS.Back {
	key = "synergy",
	atlas = "TLB_Backs",
	pos = {
		x = 1,
		y = 0
	},
	unlocked = true,
	discovered = true,
	config = {
		extra = {
			xmult_bonus = 1.3,
			xchips_mult = 1.3,
			chips_steel = 20,
		},
	},
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				self.config.extra.xmult_bonus,
				self.config.extra.xchips_mult,
				self.config.extra.chips_steel,
				colours = {
					HEX("999999")
				}
			}
		}
	end,
	calculate = function(self, back, context)
		if context.cardarea == G.play and context.individual then
			if SMODS.has_enhancement(context.other_card, "m_bonus") then
				return {
					xmult = self.config.extra.xmult_bonus
				}
			end
			
			if SMODS.has_enhancement(context.other_card, "m_mult") then
				return {
					xchips = self.config.extra.xchips_mult
				}
			end
		end
		
		if context.cardarea == G.hand and context.individual then
			if SMODS.has_enhancement(context.other_card, "m_steel") then
				return {
					mult = self.config.extra.chips_steel
				}
			end
		end
	end
}
