return {
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = { "lua", "c", "cpp", "markdown", "markdown_inline", "python", "vim", "vimdoc" },
			sync_intall = false,
			auto_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		}
	end
}
