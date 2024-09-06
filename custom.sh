#!/usr/bin/env bash

function tmux-sessionizer() {
	if [[ $# -eq 1 ]]; then
		selected=$(find ~/dev ~/.config -mindepth 1 -maxdepth 4 -exec test -e '{}/.git' ';' -print -prune -type d | fzf --filter="$1" | head -n 1)
	else
		selected=$(find ~/dev ~/.config -mindepth 1 -maxdepth 4 -exec test -e '{}/.git' ';' -print -prune -type d | fzf)
	fi

	if [[ -z $selected ]]; then
		kill -INT $$
	fi

	selected_name=$(basename "$selected" | tr . _)

	tmux new-session -A -s $selected_name -c $selected
}
