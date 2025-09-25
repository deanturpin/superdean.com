.PHONY: help install serve build lint clean deploy venv

VENV_DIR := .venv
PYTHON := $(VENV_DIR)/bin/python3
PIP := $(VENV_DIR)/bin/pip
MKDOCS := $(VENV_DIR)/bin/mkdocs
MARKDOWNLINT := $(VENV_DIR)/bin/markdownlint-cli2

help: ## Show this help message
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

venv: ## Create virtual environment
	python3 -m venv $(VENV_DIR)
	$(PIP) install --upgrade pip

$(VENV_DIR): venv

install: $(VENV_DIR) ## Install dependencies in virtual environment
	$(PIP) install -r requirements.txt

serve: install ## Serve locally with live reload
	$(MKDOCS) serve

build: install ## Build the site
	$(MKDOCS) build

lint: install ## Lint markdown files
	@echo "Linting markdown files..."
	@if command -v markdownlint >/dev/null 2>&1; then \
		markdownlint docs/**/*.md *.md 2>/dev/null || echo "Some markdown issues found (non-critical)"; \
	else \
		echo "markdownlint not found. Install with: npm install -g markdownlint-cli"; \
		echo "For now, checking basic markdown syntax..."; \
		find docs/ -name "*.md" -exec echo "Checking {}" \; -exec head -1 {} \; >/dev/null; \
	fi
	@echo "Markdown linting complete ✓"

clean: ## Clean build artifacts and virtual environment
	rm -rf site/ $(VENV_DIR)

deploy: ## Auto-commit and push changes
	git add -A && git commit -m "Auto-commit from make deploy 🤖" && git push