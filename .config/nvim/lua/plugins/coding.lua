return {

	--- auto close brackets
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	--- code commenting
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	--- text surrounding
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},

	--- file formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					typescript = { "biome" },
					typescriptreact = { "biome" },
					javascript = { "biome" },
					javascriptreact = { "biome" },
					lua = { "stylua" },
				},
				format_on_save = { lsp_fallback = true },
			})
		end,
	},
}
