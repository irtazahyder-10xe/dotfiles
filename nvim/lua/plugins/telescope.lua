return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
		{ '<leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Telescope live grep' },
	},
}
