return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate", -- only runs after plugin is loaded
  event = { "BufReadPost", "BufNewFile" }, -- lazy-load
  opts = {
    ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css", "json" },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
