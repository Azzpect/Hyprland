return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter").setup({
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
        'css',
        'java',
        'go'
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
