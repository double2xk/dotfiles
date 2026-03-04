return {

  --- tools
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  --- completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({
            select = true
          }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = {
          { name = "nvim_lsp" },
        },
      })
    end,
  },

  --- lsp servers
  "neovim/nvim-lspconfig",
  config = function()
    -- Enable LSP servers using new Neovim 0.11 API
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configure tailwind BEFORE enabling
    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,
      settings = {
        tailwindCSS = {
          includeLanguages = {
            elixir = "html-eex",
            eelixir = 'html-eex',
            heex = "html-eex",
          }
        }
      }
    })

    -- Enable servers
    vim.lsp.enable("ts_ls", {
      capabilities = capabilities,
    })

    vim.lsp.enable("html", {
      capabilities = capabilities,
    })

    vim.lsp.enable("cssls", {
      capabilities = capabilities,
    })

    vim.lsp.enable("lua_ls", {
      capabilities = capabilities,
    })

    vim.lsp.enable("tailwindcss")

    -- Keymaps when LSP attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })
  end,
}
