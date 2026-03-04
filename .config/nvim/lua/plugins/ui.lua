return {

  --- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      }
    }
  },

  --- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "solarized-osaka",
          section_separators = { left = "", right = "" },
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {},

          lualine_x = { { "filetype", icon_only = false } },

          lualine_y = { { "location", padding = { left = 0, right = 1 } }, { "progress", padding = { left = 0, right = 1 } } },
          lualine_z = { { 'datetime', style = "%H:%M", icon = "" } },
        },
      })
    end,
  },
}
