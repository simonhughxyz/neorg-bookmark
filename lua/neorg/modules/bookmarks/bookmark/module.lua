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
            "core.neorgcmd",
            "core.keybinds",
        },
    }
end

module.load = function()
  log.info("BOOKMARK loaded!")

    -- Register keybinds
    module.required["core.keybinds"].register_keybinds(module.name, { "compile", "views", "edit", "capture" })

    -- Add neorgcmd commands
    module.required["core.neorgcmd"].add_commands_from_table({
        bookmark = {
            args = 1,
            subcommands = {
                compile = { args = 0, name = "bookmark.compile" },
                views = { args = 0, name = "bookmark.views" },
                edit = { args = 0, name = "bookmark.edit" },
                capture = { args = 0, name = "bookmark.capture" },
            },
        },
    })
end

module.on_event = function(event)
    if vim.tbl_contains({ "core.keybinds", "core.neorgcmd" }, event.split_type[1]) then
        if vim.tbl_contains({ "bookmark.compile", "bookmarks.bookmark.compile" }, event.split_type[2]) then
            vim.schedule(function() module.public.compile() end)
        elseif vim.tbl_contains({ "bookmark.views", "bookmarks.bookmark.views" }, event.split_type[2]) then
            vim.schedule(function() module.public.views() end)
        elseif vim.tbl_contains({ "bookmark.edit", "bookmarks.bookmark.edit" }, event.split_type[2]) then
            vim.schedule(function() module.public.edit() end)
        elseif vim.tbl_contains({ "bookmark.capture", "bookmarks.bookmark.capture" }, event.split_type[2]) then
            vim.schedule(function() module.public.capture() end)
        end
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
    ["core.neorgcmd"] = {
        ["bookmark.compile"] = true,
        ["bookmark.views"] = true,
        ["bookmark.edit"] = true,
        ["bookmark.capture"] = true,
    },
}

return module
