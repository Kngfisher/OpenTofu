GENERATE_README_SCRIPT ?= ./.gitlab/scripts/generate-readme.sh
RELEASE_SCRIPT ?= ./.gitlab/scripts/release.sh

.PHONY: all
all: docs

.PHONY: docs
docs:
	$(GENERATE_README_SCRIPT)

.PHONY: release
release:
	$(RELEASE_SCRIPT) $(VERSION)
