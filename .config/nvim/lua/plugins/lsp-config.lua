return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "html",
          "cssls",
          "pyright",
          "prismals",
          "tailwindcss",
          "jdtls",
          "clangd",
          "gopls",
          "sqls",
          "phpactor",
          "svelte",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "pyright",
        "prismals",
        "tailwindcss",
        "jdtls",
        "clangd",
        "gopls",
        "phpactor",
        "svelte",
      }

      -- Define configs
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- Special case: sqls
      vim.lsp.config("sqls", {
        capabilities = capabilities,
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
        end,
      })

      -- Enable all servers
      vim.lsp.enable(servers)
      vim.lsp.enable("sqls")

      -- Keymaps
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>da", vim.lsp.buf.definition)
      vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
  },
}
