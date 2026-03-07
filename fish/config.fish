# ======================== ENV VARS ======================== 
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export EDITOR="/opt/nvim-linux-x86_64/bin/nvim"
export RISCV="/home/lpt-10xe-10/Desktop/10xAssignments/RISCV64/riscv64-unknown-elf-toolchain"
export PATH="$PATH:$RISCV/bin"

# ======================== FISH CONFIGS ======================== 
fish_config theme choose "Catppuccin Mocha"

# ======================== ALIAS & KEYBINDS ======================== 
if status is-interactive
    bind -M insert \cr history-pager
	alias ... "cd ../.."
	alias .... "cd ../../.."
    register-python-argcomplete --shell fish pipx >~/.config/fish/completions/pipx.fish
end

# ======================== CUSTOM FUNCTIONS ======================== 

function modified_fish_vi_key_bindings
	fish_vi_key_bindings
	bind -M insert \cf accept-autosuggestion
end
set -g fish_key_bindings modified_fish_vi_key_bindings

function mcd
	mkdir -p $argv
	cd $argv[1]
end

function patch_font -a font -d "Patches a given nerd font from zip file in the current directory"
	sudo unzip $font -d /usr/share/fonts/
	sudo fc-cache -fv
end

# Created by `pipx` on 2026-03-07 10:02:57
set PATH $PATH /home/hydeminister/.local/bin
