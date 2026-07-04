-- Welcome to the main file for True Limit Break.
-- Originally, this file contained all the code that makes everything work.
-- Now, it instead just tells the game to load a bunch of other files that are what actually make things work.
-- This change has been made for organisation reasons.
-- It also serves the secondary purpose of making debugging easier.





assert(SMODS.load_file("Hooks.lua"))()
assert(SMODS.load_file("Atlases.lua"))()
assert(SMODS.load_file("Blinds.lua"))()
assert(SMODS.load_file("Backs.lua"))()
assert(SMODS.load_file("Jokers.lua"))()
