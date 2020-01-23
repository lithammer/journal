complete -c journal -s h -d 'Display help and exit'
complete -c journal -s l -d 'List journals'
complete -c journal -s r -x -a '(journal -l)' -d 'Remove journal'
complete -c journal -f -a '(journal -l)'
