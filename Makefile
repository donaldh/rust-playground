PROJECTS=tokio-s tokio-c

build:	## Build all playground projects
build: ACTION = build
build:	$(PROJECTS)

clean:	## Clean all playground projects
clean: ACTION = clean
clean: $(PROJECTS)

$(PROJECTS):
	cd $@ && cargo $(ACTION)

help:	## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: help build $(PROJECTS)
.DEFAULT_GOAL := help
