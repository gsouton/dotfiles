pcall(require, "impatient")

if require "first_load"() then
    return
end

require("configuration")
require("plug") -- package manager and plugins
require("plugins.configuration") -- configuration for each plugin

require("keybindings") -- set keybinding
require("colors") -- colors theme

