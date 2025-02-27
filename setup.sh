#!/bin/bash

# virtual environment

printf 'Setting up the python virtual environment (including dev dependencies)\n'
poetry install

# githooks

printf 'Installing githooks\n'
make githooks
