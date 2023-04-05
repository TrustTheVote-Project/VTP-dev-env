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
    END	:= \033[0m
else
    RED	:=
    END	:=
endif

# Let there be no default target
.PHONY: default
default:
	@echo "${RED}There is no default make target.${END}  Specify one of:"
	@echo "main      - will git checkout latest main commit in each submodule"
	@echo "update    - will update the submodules to the latest commits on main"
	@echo "install   - will install the aggregate poetry env for backend VTP development"
	@echo "etags     - constructs an emacs tags table"
	@echo ""

# checkout the latest on main on all the submodules
.PHONY: main
main:
	git submodule init
# get latest commits from remote
	git submodule update --recursive --remote
# set the submodules branch to main instead of detached
	${MAKE} update

# Update the submodules to the latest commits on main
.PHONY: update
update:
	git submodule foreach git checkout main

# Create a poetry based local-install for VTP development
.PHONY: install
install:
	poetry install

# emacs tags
ETAG_SRCS := $(shell find * -type f -name '*.py' -o -name '*.md' | grep -v defunct)
.PHONY: etags
etags: ${ETAG_SRCS}
	etags ${ETAG_SRCS}
