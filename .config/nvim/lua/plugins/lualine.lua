
local function LoadWalLualine()
    local json = vim.fn.json_decode
    local wal_file = vim.fn.expand("~/.cache/wal/colors.json")

    -- read and decode JSON safely
    local lines = vim.fn.readfile(wal_file)
    if not lines or #lines == 0 then
        return {}
    end
    local wal_data = json(table.concat(lines, "\n"))

    local bg = wal_data.special.background
    local fg = wal_data.special.foreground
    local c = wal_data.colors

    -- Define a custom theme table
    local theme = {
        normal = {
            a = { fg = bg, bg = c.color4, bold = true },
            b = { fg = c.color4, bg = bg },
            c = { fg = fg, bg = bg },
        },
        insert = {
            a = { fg = bg, bg = c.color3, bold = true },
            b = { fg = c.color3, bg = bg },
            c = { fg = fg, bg = bg },
        },
        visual = {
            a = { fg = bg, bg = c.color2, bold = true },
            b = { fg = c.color2, bg = bg },
            c = { fg = fg, bg = bg },
        },
        replace = {
            a = { fg = bg, bg = c.color6, bold = true },
            b = { fg = c.color6, bg = bg },
            c = { fg = fg, bg = bg },
        },
        inactive = {
            a = { fg = fg, bg = bg },
            b = { fg = fg, bg = bg },
            c = { fg = fg, bg = bg },
        },
    }

    return theme
end

local theme = LoadWalLualine()

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = theme,
                section_separators = "",
                component_separators = "",
            },
        })
    end,
}
