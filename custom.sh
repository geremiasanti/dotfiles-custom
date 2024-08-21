#!/usr/bin/env bash
#

function tmux-sessionizer() {
	selected=$(find ~/dev ~/.config -mindepth 1 -maxdepth 4 -exec test -e '{}/.git' ';' -print -prune -type d | fzf)

	selected_name=$(basename "$selected" | tr . _)
	tmux_running=$(pgrep tmux)

	if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
		tmux new-session -s $selected_name -c $selected
	fi
}
