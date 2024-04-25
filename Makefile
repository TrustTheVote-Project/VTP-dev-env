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
	@echo "init      - will git checkout each submodule to the tracked"
	@echo "            commit (resulting in a git detached HEAD)"
	@echo "status    - will print the git status for all the repos"
	@echo "etags     - constructs an emacs tags table"
	@echo ""

# checkout the latest on main on all the submodules
.PHONY: init
init:
	git submodule update --init --merge --remote --recursive

.PHONY: status
status:
	@echo "${YELLOW}Running: git submodule foreach git status${END}"
	@git submodule foreach git status
	@echo "${YELLOW}Running: git status${END}"
	@git status

# emacs tags
ETAG_SRCS := $(shell find * -type f -name '*.py' -o -name '*.md' | grep -v defunct)
.PHONY: etags
etags: ${ETAG_SRCS}
	etags ${ETAG_SRCS}
