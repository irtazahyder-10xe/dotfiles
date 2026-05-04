# ======================== ENV VARS ======================== 
set -U RISCV "/home/lpt-10xe-10/Desktop/10xAssignments/RISCV64/riscv64-unknown-elf-toolchain"
set -a PATH "/opt/nvim-linux-x86_64/bin"
set -a PATH "$RISCV/bin"
set -U EDITOR "/opt/nvim-linux-x86_64/bin/nvim"
set -U QEMU_PATH "/home/lpt-10xe-10/Desktop/10xAssignments/qemu/qemu"
set -U PITON_ROOT "/home/lpt-10xe-10/Desktop/10xAssignments/OpenPiton/openpiton"

# ======================== FISH CONFIGS ======================== 
fish_config theme choose "Catppuccin Mocha" --color-theme=dark

# ======================== ALIAS & KEYBINDS ======================== 
if status is-interactive
    bind -M insert ctrl-r history-pager
	abbr -a --position anywhere work_dir "~/Desktop/10xAssignments"
	abbr -a -position anywhere qemu_docs "~/Desktop/10xAssignments/qemu/qemu/docs/manual/html/index.html"
	abbr -a --position anywhere verif_local "~/Desktop/10xAssignments/github/iommu/verif/"
	abbr -a --position anywhere verif_remote "Desktop/10x_iommu/verif/"
	alias ... "cd ../.."
	alias .... "cd ../../.."
	alias logisim "java -jar ~/Downloads/logisim-evolution-4.0.0-all.jar"
	alias vcs "docker start synopsys_vcs-synopsys-1; docker attach synopsys_vcs-synopsys-1"
	alias qemu "cd /home/lpt-10xe-10/Desktop/10xAssignments/qemu"
	alias qemu "cd /home/lpt-10xe-10/Desktop/10xAssignments/qemu"
	alias server "ssh irtazah-10x@110.93.227.81 -p 1019"
    register-python-argcomplete --shell fish pipx >~/.config/fish/completions/pipx.fish
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

# Obselete as now use ssh instead of HTTPS
function git_auto_push -a branch -d "Push to remote repo"
	set un "irtazahyder-10xe"
	set pass "$(tail -n1 ~/.config/.github_token)"
	set repo $(git remote -v | head -n1 | egrep -o "github.com/[^ ]+*")

	set origin "https://$un:$pass@$repo"

	git push $origin $branch
end

function sync_with_server -d "Updates verif folder for iommu project on server"
	argparse 's/rsync_flags=+' 'i/ignore_file=' 'h/help' -- $argv
	or return

	if set -ql _flag_help
		echo "Usage: sync_with_server [-s | rsync_flags=RSYNC_FLAGS] [-i | ignore_file=FILE]"
		return 0
	end

	set -ql _flag_rsync_flags

	# By default .rsync_ignore is taken. If this files does not exist then throw error
	set -l ignore_file $(pwd)/.rsync_ignore
	set -ql _flag_ignore_file
	and set ignore_file $_flag_ignore_file

	if test ! -e "$ignore_file"
		echo "rsync exclude file $ignore_file does not exist, please create it!"
		return 1
	end

	rsync $_flag_rsync_flags -aivre 'ssh -p 1019' \
		~/Desktop/10xAssignments/github/iommu/verif/iommu_pwc/ \
		irtazah-10x@rocky:Desktop/10x_iommu/verif/iommu_pwc/ \
		--exclude-from=$ignore_file
end

function rocky_xcelium -a target -d "Compiles xcelium on Rocky Server"
	ssh -p 1019 irtazah-10x@rocky "cd Desktop/10x_iommu/verif/iommu_pwc;make $target"
end

# Created by `pipx` on 2026-03-09 10:39:58
set PATH $PATH /home/lpt-10xe-10/.local/bin
