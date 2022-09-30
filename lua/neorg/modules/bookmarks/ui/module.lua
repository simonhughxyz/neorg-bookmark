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
    }
end

module.public = {
    edit_bookmark_at_cursor = function()
        print "edit bookmark at cursor"
    end,
    show_capture_popup = function()
        print "show capture popup"
    end,
    show_views_popup = function()
        print "show views popup"
    end,
    compile = function()
        print "compile bookmarks"
    end,
}

return module
