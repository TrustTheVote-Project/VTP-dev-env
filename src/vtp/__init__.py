# Needed to allow 'poetry install' to work.
#
# Note that this makes 'src/vtp' in this project NOT be a namespace package.
# This is unintuitive, but it won't break anything *in this case* because
# this project is never being imported by any other project and exists only
# to be the container for the other projects.
#
# The reason it is necessary is because `pathlib.Path.glob` will not follow
# symbolic links, and thus `poetry install` won't either.
