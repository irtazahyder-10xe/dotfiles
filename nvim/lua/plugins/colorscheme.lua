return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = true,
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			},
			flavour = "frappe",
		},
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			transparent = false,
			-- styles = {
			-- 	sidebars = "transparent",
			-- 	floats = "transparent",
			-- },
		},

	}
}
