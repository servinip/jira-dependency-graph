.PHONY: install test format

install_poetry:
	pip install --upgrade pip
	pip install poetry

install:
	poetry install

format:
	poetry run pydocstyle
	poetry run mypy .
	poetry run isort .
	poetry run black .

test:
	poetry run pytest

githooks: install
	poetry run pre-commit install --hook-type pre-commit --hook-type pre-push
