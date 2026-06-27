





-- Hook for the second effect of Big Hands
local score_card_ref = SMODS.score_card
function SMODS.score_card(card, context)
	if not G.scorehand and context.cardarea == "unscored" and next(SMODS.find_card("j_TLB_hhaanndd")) then
		G.scorehand = true
		context.cardarea = G.hand
		SMODS.score_card(card, context)
		G.scorehand = nil
		context.cardarea = "unscored"
	end
	return score_card_ref(card, context)
end