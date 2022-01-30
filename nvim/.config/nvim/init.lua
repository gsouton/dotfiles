pcall(require, "impatient")

if require "first_load"() then
    return
end

require("configuration") -- basic editor settings
require("packer_plugins") -- package manager and plugins
require("plugins.configuration") -- configure each plugin
require("keybindings") -- set keybinding
require("colors") -- colors theme
