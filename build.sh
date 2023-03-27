ls *.md | sed 's/\.md//g' | awk '{ print "- ["$0"]("$0".html)" }' > index.md
REPO=$(git remote -v | head -n 1 | cut -f 2 | cut -d ' ' -f 1)

