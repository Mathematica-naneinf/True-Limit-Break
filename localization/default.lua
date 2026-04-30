return {
	descriptions = {
		Back = {
			b_TLB_test = {
				name = "Test Deck",
				text = {
					"Start run with a {C:attention,T:j_TLB_test}Test Joker{}",
					"{s:0.4} ",
					"{s:0.8,C:inactive}(Effect may change between updates)",
				},
			},
		},
		Blind={},
		Edition={},
		Enhanced={},
		Joker = {
			j_TLB_test = {
				name = "Test Joker",
				text = {
					"nil",
					"{s:0.4} ",
					"{s:0.8,C:inactive}(Effect will change between most updates, and",
					"{s:0.8,C:inactive}may contain untested or broken code)",
					"{s:0.4} ",
					"{s:0.7,C:inactive}\"Sneak preview?\"",
				},
			},
			
			j_TLB_early = {
				name = "Early Bird",
				text = {
					"Gives {X:mult,C:white}X#1#{} Mult {C:attention}before{}",
					"cards are scored",
				},
			},
			
			j_TLB_dash = {
				name = "Geometry Dash",
				text = {
					"Played cards have a {C:green}#1# in #2#{} chance",
					"to give {X:mult,C:white}X#3#{} mult when scored",
					"{s:0.4} ",
					"{s:0.7,C:inactive}\"You waited {s:0.9,C:inactive}how{s:0.7,C:inactive} many years?\"",
				},
			},
			
			j_TLB_shred = {
				name = "Paper Shredder",
				text = {
					"This Joker gains {C:chips}#4#{} chips and {C:mult}#3#{} mult per",
					"card discarded, {C:red,E:1,s:1.2}DESTROYS{} discarded cards",
					"{C:inactive}(Currently {C:chips}#2#{C:inactive} chips and {C:mult}#1#{C:inactive} mult){}",
				},
			},
			
			j_TLB_switch = {
				name = "The Ol' Switcheroo",
				text = {
					"Played {C:attention}unscoring{} cards give {C:money}#1#${}",
					"and {C:purple}swap{} chips and mult",
				},
			},
			
			j_TLB_alien = {
				name = "Alien's Rock",
				text = {
					"Levels up the played hand, and",
					"all hands contained within it",
					"by {C:planet}#1#{} levels",
				},
			},


		},
		Other={},
		Planet={},
		Spectral={},
		Stake={},
		Tag={},
		Tarot={},
		Voucher={},
	},
	misc = {
		achievement_descriptions={},
		achievement_names={},
		blind_states={},
		challenge_names={},
		collabs={},
		dictionary={},
		high_scores={},
		labels={},
		poker_hand_descriptions={},
		poker_hands={},
		quips={},
		ranks={},
		suits_plural={},
		suits_singular={},
		tutorial={},
		v_dictionary={},
		v_text={},
	},
}