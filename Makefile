include gae/tap/Makefile.in
include gae/tap/Makefile.test

LOCALES=ja

all: test css mo js test_tap tap

tap:
	make --no-print-directory -C $(TAP_DIR)
