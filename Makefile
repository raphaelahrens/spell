
DICT_FILES = $(shell find . -maxdepth 1 -type f -name "[a-z]*" ! -name "*.*")
SPELL_FILES = $(patsubst %,%.utf-8.spl,$(DICT_FILES))

.PHONY: all clean

all: $(SPELL_FILES)

%.utf-8.spl: %
	@vim -i NONE -u NORC -U NONE -V1 -nNesc 'execute ":mkspell! " . fnameescape("$<") | echo "" | qall!'

clean:
	rm -r $(SPELL_FILES)
