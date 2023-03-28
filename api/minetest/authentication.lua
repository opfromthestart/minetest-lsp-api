---@meta
---Authentication
-----------------

---@alias mt.PrivsSet { [string]: boolean }

---Converts string representation of privs into table form
---@param str string String to convert.
---@param delim? string String separating the privs. Defaults to `","`.
---@return mt.PrivsSet # `{ priv1 = true, ... }`
function minetest.string_to_privs(str, delim) end

---Returns the string representation of `privs`
---@param privs mt.PrivsSet `{ priv1 = true, ... }`
---@param delim? string String to delimit privs. Defaults to `","`.
---@return string
function minetest.privs_to_string(privs, delim) end

---@param name string
---@return mt.PrivsSet # `{ priv1 = true, ... }`
---Calls the authentication handler.
---@see mt.AuthHandlerDef
function minetest.get_player_privs(name) end

---A quickhand for checking privileges.
---`player_or_name`: Either a Player object or the name of a player.
---`...` is either a list of strings, e.g. `"priva", "privb"` or
---a table, e.g. `{ priva = true, privb = true }`.
---@param player_or_name mt.PlayerObjectRef|string
---@param ... string
---@return boolean
---@return string[]?
---@overload fun(player_or_name: mt.PlayerObjectRef|string, privs: mt.PrivsSet): boolean, string[]?
function minetest.check_player_privs(player_or_name, ...) end

---Returns true if the "password entry" for a player with name matches given
---password, false otherwise.
---The "password entry" is the password representation generated by the
---engine as returned as part of a `get_auth()` call on the auth handler.
---Only use this function for making it possible to log in via password from
---external protocols such as IRC, other uses are frowned upon.
---@param name string
---@param entry string
---@param password string
---@return boolean
function minetest.check_password_entry(name, entry, password) end

---Convert a name-password pair to a password hash that Minetest can use.
---The returned value alone is not a good basis for password checks based
---on comparing the password hash in the database with the password hash
---from the function, with an externally provided password, as the hash
---in the db might use the new SRP verifier format.
---For this purpose, use `minetest.check_password_entry` instead.
---@see minetest.check_password_entry
---@param name string
---@param raw_password string
---@return string
function minetest.get_password_hash(name, raw_password) end

---@param name string player name
---@return string # An IP address string for the player.
---The player needs to be online for this to be successful.
function minetest.get_player_ip(name) end

---@return mt.AuthHandlerDef # currently active auth handler
---* Must be called *after* load time, to ensure that any custom auth handler was
---  already registered.
---* Use this to e.g. get the authentication data for a player:
---  `local auth_data = minetest.get_auth_handler().get_auth(playername)`
function minetest.get_auth_handler() end

---@param name string; if omitted, all auth data should be considered modified
---Must be called by the authentication handler for privilege changes.
---@see mt.AuthHandlerDef
function minetest.notify_authentication_modified(name) end

---Set password hash of player `name`.
---@param name string
---@param password_hash string
---Calls the authentication handler.
---@see mt.AuthHandlerDef
function minetest.set_player_password(name, password_hash) end

---Set privileges of player `name`.
---@param name string
---@param privs mt.PrivsSet
---Calls the authentication handler.
---@see mt.AuthHandlerDef
function minetest.set_player_privs(name, privs) end

---* See `reload()` in authentication handler definition
---Calls the authentication handler.
---@see mt.AuthHandlerDef
function minetest.auth_reload() end
