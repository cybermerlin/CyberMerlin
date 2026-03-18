#!/bin/bash

# Get the last 3 modified .md files by modification time, excluding index.md and README.md
> temp
for file in $(git log --name-only --pretty=format: --since="6 months ago" -- "*.md" | grep -E "\.md$" | grep -v "^index\.md$" | grep -v "^README\.md$" | grep -v "^_site/" | sort -u); do
  if [ -f "$file" ]; then
    timestamp=$(git log -1 --format="%ct" -- "$file")
    text=$(sed '1{/^---$/!q};1,/^---$/d;/^---$/q' "$file" | head -n 6 | tr '\n' ' ' | cut -c1-500 | sed 's/$/.../')
    echo -e "$timestamp $file \n $text" >> temp
  fi
done

sort -nr temp | head -3 | awk '{print "- ["$2"]("$2") - " $3 " - \"" $4 "\""}' > temp2

# Remove everything from "Here are the last three added md-files:" to the end of the file
sed -i '/## Recent Updates/,$d' index.md

# Then, add the new section at the end
echo "" >> index.md
echo "## Recent Updates" >> index.md
echo "" >> index.md
cat temp2 >> index.md
echo "{: .recent-updates}" >> index.md

rm temp temp2