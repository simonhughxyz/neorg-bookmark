--[[
    UI

    This module is a sub-module for `bookmarks.bookmark`
--]]

require("neorg.modules.base")

local module = neorg.modules.create("bookmarks.ui")

module.setup = function()
    return {
        success = true,
        requires = {
            "core.ui",
        },
        imports = {
            "capture_popup",
        },
    }
end

module.public = {
    display_messages = function()
        vim.cmd(string.format([[echom '%s']], "Press ESC to exit without saving"))
    end,
    edit_bookmark_at_cursor = function()
        print "edit bookmark at cursor"
    end,
    show_views_popup = function()
        print "show views popup"
    end,
    compile = function()
        print "compile bookmarks"
    end,
}

return module
