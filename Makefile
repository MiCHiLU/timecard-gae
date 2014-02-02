include gae/tap/Makefile.in

LOCALES=ja
DART = $(wildcard $(GAE_DIR)/dart/web/*.dart)
DARTHAML = $(wildcard $(GAE_DIR)/dart/web/*.haml)
DARTHTML = $(DARTHAML:.haml=.html)

dart: $(DART) $(DARTHTML)
	cd $(GAE_DIR)/dart; pub build

template: $(MINJS) mo $(GAE_LIB_PACKAGES_DIR) $(TEMPLATES_COMPILED_ZIP_PATH) $(DARTHTML)
