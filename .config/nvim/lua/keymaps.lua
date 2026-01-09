vim.g.mapleader = " "
vim.o.termguicolors = true
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set clipboard+=unnamedplus")
vim.keymap.set('i', 'kj', '<ESC>', {})
vim.keymap.set("n", '<leader>y', '"+y', {})
vim.keymap.set("n", '<leader>yy', '"+yy', {})
vim.keymap.set("n", '<leader>pp', '"+p', {})

vim.keymap.set('n', '<leader>sh', ':split<CR>', {})
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', {})
vim.keymap.set('n', '<leader>sx', '<C-w>c', {})
vim.keymap.set('n', '<leader>j', '<C-w>j', {})
vim.keymap.set('n', '<leader>h', '<C-w>h', {})
vim.keymap.set('n', '<leader>k', '<C-w>k', {})
vim.keymap.set('n', '<leader>l', '<C-w>l', {})


vim.diagnostic.config({ 
  virtual_text = false, virtual_lines = { current_line = true }
}) 
