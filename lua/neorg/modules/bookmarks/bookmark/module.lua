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

    compile = function()
        print "bookmark compile"
    end,
    views = function() 
        print "bookmark views"
    end,
    edit = function()
        print "bookmark edit"
    end,
    capture = function()
        print "bookmark capture"
    end,
}

module.config.pulic = {
    -- the file name to compile bookmarks too
    compile_file = "bookmarks.norg",
    -- excluded files or directories from bookmark parsing
    exclude = {},
}

return module
