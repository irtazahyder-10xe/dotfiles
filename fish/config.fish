# if status is-interactive
# end

# Color is ayu mirage
#
#----------- Aliases -----------
abbr --add partition --position anywhere "/mnt/Badar_ki_Bhans/"

#----------- NVIM Settings -----------
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

#----------- VI Key Binds -----------
function modified_vi_keybinds
	fish_vi_key_bindings
	bind -M insert ctrl-f accept-autosuggestion
end

set -g fish_key_bindings modified_vi_keybinds

#----------- Git -----------
function git_auto_push
	set un "SyedMIrtazaHyder"
	set pass "$(cat /mnt/Badar_ki_Bhans/github/githubToken | head -n1)"
	set repo $(git remote -v | head -n1 | egrep -o "github.com/[^ ]+*")
	set branch $1

	set origin "https://$un:$pass@$repo"

	git push $origin $branch
end

abbr --add gp --function git_auto_push
