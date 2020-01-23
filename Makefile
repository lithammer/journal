XDG_CONFIG_HOME ?= $(HOME)/.config
XDG_DATA_HOME ?= $(HOME)/.local/share

BIN_DIR ?= $(HOME)/bin
# https://github.com/scop/bash-completion/blob/master/README.md#faq
BASH_COMPLETION_USER_DIR ?= $(XDG_DATA_HOME)/bash-completion
ZSH ?= $(HOME)/.zsh

BIN = $(BIN_DIR)/journal
BASH_COMPLETION = $(BASH_COMPLETION_USER_DIR)/completions/journal
FISH_COMPLETION = $(XDG_CONFIG_HOME)/fish/completions/journal.fish
ZSH_COMPLETION = $(ZSH)/completions/_journal
COMPLETIONS = $(BASH_COMPLETION) $(FISH_COMPLETION) $(ZSH_COMPLETION)
MANPAGE = $(XDG_DATA_HOME)/man/man1/journal.1.gz

all:

man: man/journal.1.gz
man/journal.1.gz: man/journal.1.pod
	pod2man -n journal -c 'Journal Manual' -r '' $< $(basename $@)
	gzip $(basename $@)

install: $(BIN) $(COMPLETIONS) $(MANPAGE)

uninstall:
	$(RM) $(COMPLETIONS) $(BIN) $(MANPAGE)
	rmdir -p $(dir $(COMPLETIONS) $(MANPAGE))

clean:
	$(RM) man/journal.1 man/journal.1.gz

$(BIN): journal
	@mkdir -p $(dir $@)
	install -m0755 $< $@

$(BASH_COMPLETION): completions/journal.bash
	@mkdir -p $(dir $@)
	install -m0644 $< $@

$(FISH_COMPLETION): completions/journal.fish
	@mkdir -p $(dir $@)
	install -m0644 $< $@

$(ZSH_COMPLETION): completions/journal.zsh
	@mkdir -p $(dir $@)
	install -m0644 $< $@

$(MANPAGE): man/journal.1.gz
	@mkdir -p $(dir $@)
	install -m0644 $< $@
