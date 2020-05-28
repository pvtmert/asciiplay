#!/usr/bin/env make -f

RELEASE := v2.6.1
FILES   := $(addprefix asciinema-player, .js .css)
PORT    := 80001

all: $(FILES)

clean:
	rm -rf $(FILES)

test:
	python3 -m http.server $(PORT)

$(FILES):
	curl -#Lo "$@" \
	"https://github.com/asciinema/asciinema-player/releases/download/$(RELEASE)/$@"
