# Get all ts files and store in in an array
files=( $(find . -type f -name "*.ts") )

echo "Start of file edit"
for i in "${files[@]}" ; do
    sed -i ' 1 s/.*/& Kevin Han - 1521885/' $i
done

# Commit and push to github
cd ..
git add .
git commit -m "COMPX341-22A-Maintenance commit message"
git push