#!/bin/bash
# Generate the lib's documentation.
# Intended to be run manually from within the project folder.

# Prefer Homebrew Ruby (keg-only) over the outdated system Ruby if available.
if [ -x /opt/homebrew/opt/ruby/bin/ruby ]; then
  # Ignore gem paths set by RVM (or similar), otherwise the installed gems are not found.
  unset GEM_HOME GEM_PATH
  export PATH="/opt/homebrew/opt/ruby/bin:$(/opt/homebrew/opt/ruby/bin/gem environment gemdir)/bin:$PATH"
fi

# Update gems.
bundle update
# Generate the documentation.
bundle exec jazzy
