return {

	--- popups / notifications / ui elements
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

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
			},
		},
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
					lualine_c = { { "filetype", icon_only = false } },

					lualine_x = {
						{
							require("noice").api.status.command.get,
							cond = require("noice").api.status.command.has,
							color = { fg = "#ff9e64" },
						},
						{
							require("noice").api.status.mode.get,
							cond = require("noice").api.status.mode.has,
							color = { fg = "#ff9e64" },
						},
						{
							require("noice").api.status.search.get,
							cond = require("noice").api.status.search.has,
							color = { fg = "#ff9e64" },
						},
					},

					lualine_y = {
						{ "location", padding = { left = 0, right = 1 } },
						{ "progress", padding = { left = 0, right = 1 } },
					},
					lualine_z = { { "datetime", style = "%H:%M", icon = "" } },
				},
			})
		end,
	},
}
