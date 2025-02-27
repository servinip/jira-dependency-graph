#!/bin/bash

# project name is name of parent directory

PROJECT_NAME=${PWD##*/}
PROJECT_NAME=${PROJECT_NAME:-/}
PROJECT_NAME_UNDERSCORE="$(sed s/-/_/g <<<$PROJECT_NAME)"  # replace any hypens with underscores

# change the title of the README from kadru to the project name

printf 'changing the heading of the README from kadru to %s\n' "$PROJECT_NAME"
perl -pi -e "s/# kadru/# $PROJECT_NAME/g" README.md

# reset certain values in pyproject.toml file

printf 'reformatting pyproject.toml file\n'

printf "\tresetting project name to $PROJECT_NAME\n"
perl -pi -e "s/name = .*/description = $PROJECT_NAME/g" pyproject.toml

printf '\tresetting project description to empty string\n'
perl -pi -e 's/description = .*/description = ""/g' pyproject.toml

printf '\tresetting project repository to empty string\n'
perl -pi -e 's/repository = .*/repository = ""/g' pyproject.toml

printf '\tresetting project authors to empty list\n'
perl -0777 -pi -e 's/authors = \[[^]]+\]/authors = \[\]/g' pyproject.toml

# run standard developer set up

source ./setup.sh

printf 'deleting myself\n'
rm repo-setup.sh
