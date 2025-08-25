return 	{
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{'<leader>fs', ":Neotree action=focus source=filesystem position=right toggle=true<CR>", desc = "Neotree filesystem display"},
		-- {'<leader>g', ":Neotree git_status reveal right<CR>", desc = "Neotree git status display"},
	},
	opts = {},
}
