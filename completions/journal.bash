# shellcheck shell=bash

_journal() {
	local cur prev opts

	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD - 1]}"
	opts="-h -l -r"

	if [[ $cur == -* ]]; then
		mapfile -t COMPREPLY < <(compgen -W "$opts" -- "$cur")
		return 0
	fi

	case "$prev" in
	-h | -l) return 0 ;;
	*) ;;
	esac

	mapfile -t COMPREPLY < <(compgen -W "$(journal -l)" -- "$cur")
}

complete -F _journal journal
