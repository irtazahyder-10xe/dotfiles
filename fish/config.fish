# ======================== ENV VARS ======================== 
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export EDITOR="/opt/nvim-linux-x86_64/bin/nvim"
export RISCV="/home/lpt-10xe-10/Desktop/10xAssignments/RISCV64/riscv64-unknown-elf-toolchain"
export PATH="$PATH:$RISCV/bin"

# ======================== FISH CONFIGS ======================== 
fish_config theme choose "Catppuccin Mocha"

# ======================== ALIAS & KEYBINDS ======================== 
if status is-interactive
    bind -M insert ctrl-r history-pager
	abbr work_dir "~/Desktop/10xAssignments"
	alias clang-format clang-format-21
	alias ... "cd ../.."
	alias .... "cd ../../.."
	alias logisim "java -jar ~/Downloads/logisim-evolution-4.0.0-all.jar"
	alias vcs "docker start synopsys_vcs-synopsys-1; docker attach synopsys_vcs-synopsys-1"
end

# ======================== CUSTOM FUNCTIONS ======================== 

# alias apps "slack >/dev/null 2>&1 &; google-chrome >/dev/null 2>&1 &;"
function apps -d "Runs slack and chrome";
	slack >/dev/null 2>&1 &
	google-chrome >/dev/null 2>&1 &
end

function modified_fish_vi_key_bindings
	fish_vi_key_bindings
	bind -M insert ctrl-f accept-autosuggestion
end
set -g fish_key_bindings modified_fish_vi_key_bindings

function mcd
	mkdir -p $argv
	cd $argv[1]
end

function git_auto_push -a branch -d "Push to remote repo"
	set un "irtazahyder-10xe"
	set pass "$(tail -n1 ~/.config/.github_token)"
	set repo $(git remote -v | head -n1 | egrep -o "github.com/[^ ]+*")

	set origin "https://$un:$pass@$repo"

	git push $origin $branch
end
