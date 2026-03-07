return {
	cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
	filetypes = { 'c', 'cpp', 'h', 'hpp' },
	root_markers = { 'Makefile', '.git' },
}
