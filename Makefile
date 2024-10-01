install_poetry:
	pip install --upgrade pip
	pip install poetry

install:
	poetry install

format: install
	poetry run yapf --recursive --in-place src
	poetry run pydocstyle
	poetry run mypy .
	poetry run isort .

run_tests: install
	poetry run pytest

githooks:
	poetry run pre-commit install --hook-type pre-commit --hook-type pre-push
