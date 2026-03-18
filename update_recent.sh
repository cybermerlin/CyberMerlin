#!/bin/bash

# Get the last 3 modified .md files by modification time, excluding index.md and README.md
> temp
for file in $(git log --name-only --pretty=format: --since="6 months ago" -- "*.md" | grep -E "\.md$" | grep -v "^index\.md$" | grep -v "^README\.md$" | sort -u); do
  timestamp=$(git log -1 --format="%ct" -- "$file")
  echo "$timestamp $file" >> temp
done

sort -nr temp | head -3 | awk '{print "- ["$2"]("$2")"}' > temp2

# Remove everything from "Here are the last three added md-files:" to the end of the file
sed -i '/Here are the last three added md-files:/,$d' index.md

# Then, add the new section at the end
echo "" >> index.md
echo "## Recent Updates" >> index.md
echo "" >> index.md
echo "Here are the last three added md-files:" >> index.md
echo "" >> index.md
cat temp2 >> index.md

rm temp temp2