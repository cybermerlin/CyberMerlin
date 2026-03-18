#!/bin/bash

# Update recent.md with the latest modified .md files
bash update_recent.sh

# Build the Jekyll site
bundle exec jekyll build