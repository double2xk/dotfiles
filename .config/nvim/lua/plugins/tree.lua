return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
    config = function()
      local neotree = require('neo-tree')

      neotree.setup({
        window = {
          position = "float",
          popup = {
            size = {
              height = "80%",
              width = "50%",
            },
            position = "50%",
            border = "rounded",
          }
        }
      })

      vim.keymap.set('n', '<leader>tt', ":Neotree toggle<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>fr', ":Neotree reveal<CR>")
    end
  }
}
