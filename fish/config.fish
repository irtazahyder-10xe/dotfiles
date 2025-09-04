if status is-interactive
    bind -M insert ctrl-r history-pager
	abbr work_dir "~/Desktop/10xAssignments"
	alias clang-format clang-format-21
end

function modified_fish_vi_key_bindings
	fish_vi_key_bindings
	bind -M insert ctrl-f accept-autosuggestion
end
set -g fish_key_bindings modified_fish_vi_key_bindings

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

export EDITOR="/opt/nvim-linux-x86_64/bin/nvim"
export RISCV="/home/lpt-10xe-10/Desktop/10xAssignments/RISCV64/riscv64-unknown-elf-toolchain"
export PATH="$PATH:$RISCV/bin"

function mcd
	mkdir -p $argv
	cd $argv[1]
end
# running nvm to get node working for LSP
# nvm install 22
