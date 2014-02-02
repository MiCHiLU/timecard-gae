include gae/tap/Makefile.in

LOCALES=ja
DARTHAML = $(wildcard $(GAE_DIR)/dart/web/*.haml)
DARTHTML = $(DARTHAML:.haml=.html)

template: $(MINJS) mo $(GAE_LIB_PACKAGES_DIR) $(TEMPLATES_COMPILED_ZIP_PATH) $(DARTHTML)
