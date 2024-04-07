git stash >> /dev/null

if grep -qx $1 gomamayo.txt; then
    echo "found"
elif grep -q $1 gomamayo.txt; then
    echo "partial found"
    echo $1 >> gomamayo.txt
else
    echo "not found"
    echo $1 >> gomamayo.txt
fi

if [[ `git diff gomamayo.txt` ]]; then
    echo "Changes"

    git add gomamayo.txt
    git commit -m "add gomamayo : $1"
else
    echo "No changes"
fi

git stash apply >> /dev/null