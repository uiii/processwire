IFS=$'\r'$IFS

official_tags=$(git ls-remote --tags https://github.com/processwire/processwire | cut -f3 -d"/")
package_tags=$(git ls-remote --tags https://github.com/uiii/processwire | cut -f3 -d"/")
local_tags=$(git tag -l)

echo "$official_tags"
echo "--"
echo "$package_tags"
echo "--"
package_tags=$( (echo "$official_tags"; echo "$package_tags") | sort | uniq -d)
local_tags=$( (echo "$official_tags"; echo "$local_tags") | sort | uniq -d)

echo "$package_tags"
echo "--"
echo "$local_tags"

echo "Delete local tags"
if [ -n "$local_tags" ]; then
	echo "$local_tags" | sed -e 's/\s+/ /g' | xargs git tag -d
fi

echo "Delete remote tags"
if [ -n "$package_tags" ]; then
	echo "$package_tags" | sed -e 's/\s+/ /g' | xargs git push --delete origin
fi

echo "Create local tags"
echo "$official_tags" | sed -e 's/\s+/ /g' | xargs -n 1 git tag

echo "Push tags"
git push origin --tags