# Ancient Makefile implicit rule disabler
(%): %
%:: %,v
%:: RCS/%,v
%:: s.%
%:: SCCS/s.%
%.out: %
%.c: %.w %.ch
%.tex: %.w %.ch
%.mk:

# Variables
SRC_DIR     := src/vtp
INTERACTIVE := $(shell test -t 0 && echo 1)
ifdef INTERACTIVE
    RED	:= \033[0;31m
    YELLOW := \033[0;33;1m
    END	:= \033[0m
else
    RED	:=
    END	:=
endif

# Let there be no default target
.PHONY: help
help:
	@echo "${RED}There is no default make target.${END}  Specify one of:"
	@echo "main      - will git checkout latest main commit in each submodule"
	@echo "status    - will print the git status for all the repos"
	@echo "update    - will update the submodules to the latest commits on main"
	@echo "etags     - constructs an emacs tags table"
	@echo ""

# checkout the latest on main on all the submodules
.PHONY: main status update
main:
	git submodule init
# get latest commits from remote
	git submodule update --recursive --remote
# set the submodules branch to main instead of detached
	${MAKE} update

status:
	@echo "${YELLOW}Running: git submodule foreach git status${END}"
	@git submodule foreach git status
	@echo "${YELLOW}Running: git status${END}"
	@git status

# Update the submodules to the latest commits on main
update:
	git submodule foreach git checkout main

# emacs tags
ETAG_SRCS := $(shell find * -type f -name '*.py' -o -name '*.md' | grep -v defunct)
.PHONY: etags
etags: ${ETAG_SRCS}
	etags ${ETAG_SRCS}
