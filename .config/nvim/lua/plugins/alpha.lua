return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
    }

    _Gopts = {
      position = "center",
      hl = "Type",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "   Find file", ":cd $HOME/dotfiles | Telescope find_files<CR>"),
      dashboard.button("g", "󰱼   Find word", ":Telescope live_grep<CR>"),
      dashboard.button("c", "   Config", ":e $MYVIMRC <CR>"),
      dashboard.button("m", "󱌣   Mason", ":Mason<CR>"),
      dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
      dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
      dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
    }

    local function footer()
      return "Azzpect"
    end
    dashboard.section.footer.val = footer()

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    require("alpha").setup(dashboard.opts)
  end,
}
