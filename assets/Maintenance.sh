# Get all ts files and store in in an array
files=( $(find . -type f -name "*.ts") )

echo "Start of file edit"
for i in "${files[@]}" ; do
    sed -i ' 1 s/.*/& Kevin Han - 1521885/' $i
done
echo "End of file edit"
# Commit and push to github

echo "Push to GitHub"
cd ..
git add .
git commit -m "COMPX341-22A-Maintenance commit message"
git push
echo "Push to GitHub finished"
# Show the user that the application is done
sleep 1s