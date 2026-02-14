local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"

-- colors 

local json = vim.fn.json_decode
local wal_file = vim.fn.expand("~/.cache/wal/colors.json")
local wal_data = json(vim.fn.readfile(wal_file))


local bg = wal_data.special.background
local fg = wal_data.special.foreground

local c = wal_data.colors

-- Reset background & basic colors
vim.api.nvim_set_hl(0, "Normal", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { fg = fg, bg = "none" })

-- Basic syntax
vim.api.nvim_set_hl(0, "Comment",  { fg = c.color8, italic = true })
vim.api.nvim_set_hl(0, "Keyword",  { fg = c.color2, bold = true })
vim.api.nvim_set_hl(0, "Function", { fg = c.color4 })
vim.api.nvim_set_hl(0, "String",   { fg = c.color3 })
vim.api.nvim_set_hl(0, "Type",     { fg = c.color5 })
vim.api.nvim_set_hl(0, "Constant", { fg = c.color6 })

-- Tree-sitter
vim.api.nvim_set_hl(0, "@comment",  { fg = c.color8, italic = true })
vim.api.nvim_set_hl(0, "@keyword",  { fg = c.color2, bold = true })
vim.api.nvim_set_hl(0, "@function", { fg = c.color4 })
vim.api.nvim_set_hl(0, "@string",   { fg = c.color3 })
vim.api.nvim_set_hl(0, "@type",     { fg = c.color5 })

-- Neo-Tree

vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = c.color4 })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = c.color4 })
vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = c.color5 })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = c.color2 })
vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = c.color6 })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = c.color5 })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = c.color1 })
vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = c.color8 })

require("keymaps")
require("lazy").setup("plugins")
