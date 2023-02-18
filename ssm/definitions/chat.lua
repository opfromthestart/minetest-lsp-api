---@meta
---Chat command definition
--------------------------

-- Used by `minetest.register_chatcommand`.
---@class mt.ChatCmdDef
-- Short parameter description.
--
-- Use of symbols is as follows:
--
-- * `<>` signifies a placeholder to be replaced when the command is used. For
--   example, when a player name is needed: `<name>`
-- * `[]` signifies param is optional and not required when the command is used.
--   For example, if you require param1 but param2 is optional:
--   `<param1> [<param2>]`
-- * `|` signifies exclusive or. The command requires one param from the options
--   provided. For example: `<param1> | <param2>`
-- * `()` signifies grouping. For example, when param1 and param2 are both
--   required, or only param3 is required: `(<param1> <param2>) | <param3>`
---@field params string
---@field description string Full description.
---@field privs table Require the "privs" privilege to run.
-- * Called when command is run.
-- * Returns boolean success and text output.
-- * Special case: The help message is shown to the player if `func`
--   returns false without a text output.
---@field func fun(name:string, param:string): boolean
