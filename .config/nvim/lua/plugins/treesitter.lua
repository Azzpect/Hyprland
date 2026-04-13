return {
  'nvim-treesitter/nvim-treesitter',
  tag = "v0.10.0",
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        'bash',
        'c',
        'html',
        'lua',
        'markdown',
        'vim',
        'python',
        'javascript',
        'json',
        'typescript',
        'tsx',
        'css',
        'java',
        'go',
        'svelte'
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
