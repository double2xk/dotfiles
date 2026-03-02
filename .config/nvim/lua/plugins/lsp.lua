return {
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
