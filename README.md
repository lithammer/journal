# Journal

A simple journal tool for the command-line.

## Install

This installs the binary, tab-completion scripts and the man page in the user's
home directory.

    make install

### macOS

These are needed if you want bash-completion.

    brew install bash bash-completion@2

## Configuration

Edit `$XDG_CONFIG_HOME/journal/config`, and the following parameters are
supported:

`JOURNAL_DATA` Directory where journal files are saved.
`JOURNAL_EDITOR` The editor and arguments used to create/edit journal files.

## License

MIT
