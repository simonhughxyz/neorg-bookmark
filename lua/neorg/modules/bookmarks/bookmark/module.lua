--[[
    BOOKMARK
    A Neorg module designed to create, edit, search and organise bookmarks
--]]

require('neorg.modules.base')
require('neorg.events')

local module = neorg.modules.create("bookmarks.bookmark")
local log = require('neorg.external.log')

module.setup = function()
    return {
        success = true,
        requires = {
            "core.keybinds",
        },
    }
end

module.load = function()
  log.info("BOOKMARK loaded!")

    -- Register keybinds
    module.required["core.keybinds"].register_keybinds(module.name, { "compile", "views", "edit", "capture" })
end

module.on_event = function(event)
    if event.split_type[2] == "bookmarks.bookmark.compile" then
        vim.schedule(function() module.public.compile() end)
    elseif event.split_type[2] == "bookmarks.bookmark.views" then
        vim.schedule(function() module.public.views() end)
    elseif event.split_type[2] == "bookmarks.bookmark.edit" then
        vim.schedule(function() module.public.edit() end)
    elseif event.split_type[2] == "bookmarks.bookmark.capture" then
        vim.schedule(function() module.public.capture() end)
    end
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

module.events.subscribed = {
    ["core.keybinds"] = {
        ["bookmarks.bookmark.compile"] = true,
        ["bookmarks.bookmark.capture"] = true,
        ["bookmarks.bookmark.views"] = true,
        ["bookmarks.bookmark.edit"] = true,
    },
}

return module
