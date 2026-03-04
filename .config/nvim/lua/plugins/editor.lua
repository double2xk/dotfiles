return {

  --- indentation & position highlighting
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
    end,
  },

  --- color highlighting
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    opts = {
      render = "background",
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_hsl_without_function = true,
      enable_ansi = true,
      enable_var_usage = true,
      enable_tailwind = true,
    },
  },

  --- git blaming & repo browse
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Open file/folder in git repository
        browse = "<Leader>go",
      },
    },
  },

  --- file browser
  {
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
  },

  --- file searching
  {
    "nvim-telescope/telescope.nvim",
    version = "*",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' }
    },

    config = function()
      local telescope = require("telescope")

      telescope.setup {
        pickers = {
          find_files = {
            theme = 'ivy'
          }
        }
      }

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>en', function()
        builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set('n', '<leader>eg', function()
        builtin.find_files {
          cwd = "~/Documents/GitHub"
        }
      end)
    end,
  },
}
