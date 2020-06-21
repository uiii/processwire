IFS=$'\r'$IFS

official_tags=$(git ls-remote --tags https://github.com/processwire/processwire | cut -f3 -d"/")

echo "Official PW tags"
echo "$official_tags"

echo "Rebuild tags"
echo "$official_tags" | sed -e 's/\s+/ /g' | xargs -n 1 git tag

echo "Push tags"
git push origin --tags --force
