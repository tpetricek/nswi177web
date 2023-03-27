rm -rf .output/
ls *.md | sed 's/\.md//g' | awk '{ print "- ["$0"]("$0".html)" }' > index.md
REPO=$(git remote -v | head -n 1 | cut -f 2 | cut -d ' ' -f 1)
echo "Cloning $REPO"
git clone --branch gh-pages $REPO .output
for MD in *.md; do
	HTML=${MD%.*}.html
	pandoc --template template.html $MD > .output/$HTML
done
DATE=$(date '+%Y-%m-%d %H:%M:%S')
cd .output
git add .
git commit -m "Updating web page ($DATE)"
git push origin gh-pages
cd ..