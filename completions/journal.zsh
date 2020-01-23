#compdef journal

_journal() {
    _arguments \
        '-h[Display help and exit]:' \
        '-l[List journals]:' \
        "-r[Remove journal]:journal:($(journal -l))" \
        "::journal:($(journal -l))"
}

_journal
