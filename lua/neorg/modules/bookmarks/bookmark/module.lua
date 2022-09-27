--[[
    BOOKMARK
    A Neorg module designed to create, edit, search and organise bookmarks
--]]

require('neorg.modules.base')

local module = neorg.modules.create("bookmarks.bookmark")
local log = require('neorg.external.log')

module.load = function()
  log.info("BOOKMARK loaded!")
end

module.public = {
  version = "0.0.1",
}

module.config.pulic = {
    -- the file name to compile bookmarks too
    compile_file = "bookmarks.norg",
    -- excluded files or directories from bookmark parsing
    exclude = {},
}

return module
