#!/bin/bash
# Generate the lib's documentation.
# Intended to be run manually from within the project folder.

# Update gems.
bundle update
# Generate the documentation.
bundle exec jazzy
