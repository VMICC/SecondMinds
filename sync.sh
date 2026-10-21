#!/bin/bash
# Move into the folder where this script is located
cd "$(dirname "$0")"

# Stage everything temporarily to check for alterations
git add .

# Check if there are staged differences against the last commit
if git diff --cached --quiet; then
    echo "No modifications detected. Skipping sync."
    exit 0
fi

# If changes exist, commit and push them
git commit -m "Automated sync: $(date)"
git push origin main
