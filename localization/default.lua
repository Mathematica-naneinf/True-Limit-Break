return {
	descriptions = {
		Back = {
			b_TLB_synergy = {
				name = "Synergy Deck",
				text = {
					"{C:chips,T:m_bonus}Bonus cards{} give {X:mult,C:white}X#1#{} Mult",
					"{C:mult,T:m_mult}Mult cards{} give {X:chips,C:white}X#2#{} Chips",
					"{V:1,T:m_steel}Steel Cards{} held in hand give {C:chips}+#3#{} Chips",
				},
			},
		},
		Blind={
			bl_TLB_knight = {
				name = "The Knight",
				text = {
					"Divides score and mult by #1# every hand"
				}
			}
		},
		Edition={
			e_TLB_frost = {
				name = "Frozen",
				text = {
					"Never scores"
				}
			}
		},
		Enhanced={},
		Joker = {
			
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
			
			j_TLB_rewrite = {
				name = "Rewrite",
				text = {
					"Played {C:attention}unscoring{} cards",
					"give {C:purple}+#1#{} score."
				},
			},
			
			j_TLB_hhaanndd = {
				name = "Big Hands",
				text = {
					"{C:attention}+#1#{} hand size. Played, {C:attention}unscoring{} cards",
					"trigger {C:attention}held in hand{} effects."
				},
			},
			
			j_TLB_left_redist = {
				name = "Left Redistributor",
				text = {
					"{X:chips,C:white}X#1#{} Chips, {X:mult,C:white}X#2#{} Mult"
				}
			},
			
			j_TLB_right_redist = {
				name = "Right Redistributor",
				text = {
					"{X:chips,C:white}X#1#{} Chips, {X:mult,C:white}X#2#{} Mult"
				}
			},

			j_TLB_clover = {
				name = "Join The Club!",
				text = {
					"If {C:attention}scoring hand{} contains",
					"at least three {C:clubs}clubs{},",
					"Convert all played cards",
					"into {C:clubs}clubs{} after scoring."
				},
			},

			j_TLB_rude = {
				name = "Rude Buster",
				text = {
					"When hand is played, {V:1}-#1#{} blind requirement",
					"Damage increases by {V:1}#2#{} when {C:attention}boss blind{} is defated",
					"{s:0.4} ",
					"{s:0.7,C:inactive}#3#",
				}
			},
			
			j_TLB_heal = {
				name = "Heal Prayer",
				text = {
					"Gain {C:blue}+#1#{} hand every {C:attention}#2#{} discards",
					"{C:inactive}({C:attention}#3# {C:inactive}discards since last activation){}",
					"{s:0.4} ",
					"{s:0.7,C:inactive}#4#",
				}
			},
			
			j_TLB_ice = {
				name = "Iceshock",
				text = {
					"When hand is played, {V:1}-#1#{} blind requirement",
					"Damage increases by {V:1}#2#{} every activation",
					"Transforms into {V:2,T:j_TLB_grave}SNOWGRAVE{} after #3# activations",
					"{C:inactive}(#4# LEFT.)",
					"{s:0.4} ",
					"{s:0.7,C:inactive}\"Stronger? Right, I guess that's how it works here...\"",
				}
			},
			
			j_TLB_slash = {
				name = "X-Slash",
				text = {
					"When hand is played,",
					"{V:1}-#1#{} blind requirement {C:attention}twice",
					"{s:0.4} ",
					"{s:0.7,C:inactive}#2#",
				}
			},
			
			j_TLB_grave = {
				name = "SNOWGRAVE",
				text = {
					"When hand is played, {V:2}/#3#{} blind requirement",
					"then {V:1}-#1#{} blind requirement",
					"Damage increases by {V:1}#2#{} every activation",
					"Frost multiplies by {V:2}#4#{} when {C:attention}boss blind{} is defeated",
					"{s:0.6} ",
					"After hand scores, {V:3}freeze{} all played cards",
					"{s:0.4} ",
					"{s:0.7,C:inactive}\"WATCH WHAT HAPPENS WHEN I CAST A SPELL I DON'T KNOW!\"",
				}
			},
			
			j_TLB_frost = {
				name = "Permafrost",
				text = {
					"When hand is played, {V:1}-#1#{} blind requirement three times",
					"Damage increases by {V:1}#2#{} before every hit",
					"{s:0.4} ",
					"{s:0.7,C:inactive}\"I'm here, Kris. Where are the enemies?\"",
				}

			},
			
			j_TLB_photocopy = {
				name = "Photocopier",
				text = {
					"When hand is played, create copies of",
					"every scoring card with no",
					"editions, enhancements, or seals",
					"and draw them to hand",
					"{s:0.4} ",
					"{s:0.7,C:inactive}\"Copies are monochrome.\"",
				}
			},
			
			j_TLB_orange = {
				name = "Orange Joker",
				text = {
					"{C:chips}-#3#{} chips per hand played",
					"{C:chips}+#2#{} chips per discard",
					"{C:inactive}(Currently {C:chips}+#1#{C:inactive} chips){}"
				}
			},
			
			j_TLB_retro = {
				name = "Retro Joker",
				text = {
					"This joker gains {C:chips}#2#{} chips",
					"and {C:mult}#4#{} mult when {C:attention}skipping{} a blind",
					"{C:inactive}(Currently {C:chips}#1#{C:inactive} chips and {C:mult}#3#{C:inactive} mult){}",
				}
			},
			
			j_TLB_rook = {
				name = "Rook",
				text = {
					"This Joker gains {C:chips}#2#{} chips when",
					"a card with the same {C:attention}rank{} or {C:attention}suit{}",
					"as the last card to trigger this effect is {C:attention}scored{}",
					"{C:inactive}(Currently {C:chips}#1#{C:inactive} chips and {C:attention}#3# of #4#{C:inactive})"
				}
			}




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
