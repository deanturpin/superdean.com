# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is an MkDocs-based static website for superdean.com, focused on horology and watchmaking content. The site is deployed automatically to GitHub Pages via GitHub Actions.

## Architecture

- **MkDocs Static Site**: Uses Material for MkDocs theme with custom configuration
- **Content Structure**: Markdown files in the `docs/` directory
- **Navigation**: Configured in `mkdocs.yml` with structured navigation
- **Images**: Watch photography and tool images stored in `docs/` directory
- **Deployment**: Automated deployment to GitHub Pages via `.github/workflows/mkdocs.yml`

## Development Workflow

1. Edit Markdown content files in the `docs/` directory
2. Update navigation and site configuration in `mkdocs.yml` if needed
3. Test locally with `make serve`
4. Lint markdown files with `make lint`
5. Push changes to the `main` branch - GitHub Actions automatically builds and deploys

## Content Structure

- `docs/index.md`: Main watchmaking tools and getting started guide
- `docs/builds.md`: Current watch projects on the bench
- `docs/complete.md`: Completed watch builds
- `docs/collector.md`: Information for watch collectors
- `docs/watchmaker.md`: Advanced watchmaking techniques
- `docs/reviews.md`: Watch reviews
- `docs/marriage.md`: Marriage watch information
- `docs/tools.md`: Detailed tool information
- `docs/molniya.md`: Special Molniya watch information

## Commands

### Make Targets
The project includes a comprehensive Makefile with the following targets:

```bash
# Show help with all available targets
make help

# Install dependencies in virtual environment
make install

# Serve locally with live reload on http://127.0.0.1:8000
make serve

# Build the site to site/ directory
make build

# Lint markdown files for consistency and quality
make lint

# Clean build artifacts and virtual environment
make clean

# Auto-commit and push changes
make deploy
```

### Manual Commands
```bash
# Create virtual environment
python3 -m venv .venv

# Activate virtual environment
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Serve locally with live reload
mkdocs serve

# Build the site
mkdocs build
```

### Deployment
The site deploys automatically on push to `main` branch via GitHub Actions.

## Configuration

- `mkdocs.yml`: Main MkDocs configuration with Material theme, navigation structure, and plugins
- `requirements.txt`: Python dependencies for MkDocs and plugins
- `Makefile`: Development workflow automation with lint and serve targets
- `.markdownlint-cli2.jsonc`: Markdown linting configuration
- `.gitignore`: Git ignore patterns including virtual environment
- `CNAME`: GitHub Pages custom domain configuration for superdean.com

## GitHub Actions

The site uses a custom MkDocs GitHub Pages workflow:
- Triggered on pushes to `main` branch
- Installs Python dependencies and builds with MkDocs
- Deploys automatically to GitHub Pages