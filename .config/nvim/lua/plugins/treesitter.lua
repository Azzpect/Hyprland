return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "main",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"bash",
				"c",
				"html",
				"lua",
				"markdown",
				"vim",
				"python",
				"javascript",
				"json",
				"typescript",
				"tsx",
				"css",
				"java",
				"go",
				"svelte",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
