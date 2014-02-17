include gae/tap/Makefile.in

LOCALES=ja
gce=main_api.v1.api_class_names_string

pubserve:
	cd $(DART_DIR_PATH); pub serve --port 8081 --no-dart2js --force-poll
