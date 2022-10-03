--[[
    Submodule responsible for creating API for capture popup
--]]

local module = neorg.modules.extend("bookmarks.ui.capture_popup", "bookmarks.ui")

module.public = {
    --- Creates the selection popup for capturing a bookmarks
    show_capture_popup = function()
        -- Generate views selection popup
        local buffer = module.required["core.ui"].create_split("Quick Actions")

        if not buffer then
            return
        end

        local selection = module.required["core.ui"]
            .begin_selection(buffer)
            :listener("destroy", { "<Esc>" }, function(self)
                self:destroy()
            end)

        selection:title("Capture Bookmark"):blank():concat(module.private.capture_bookmark)
        module.public.display_messages()
    end,
}

module.private = {
    capture_bookmark = function(selection)
        return selection:title("Add a bookmark"):blank():prompt("URI", {
            callback = function(text)
                local bookmark = {}
                bookmark.uri = text

                selection:push_page()

                selection
                    :title("General informations")
                    :blank()
                    :flag("x", "Add to cursor position", function()
                        return
                    end)
                    :flag("<CR>", "Add to bookmarks", function()
                        return
                    end)

                return selection
            end,
            -- Do not pop or destroy the prompt when confirmed
            pop = false,
            destroy = false,
        })
    end,
}

return module
