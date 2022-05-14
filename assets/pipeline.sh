echo "(0) Push Update to Github"
cd ..
git add .
git commit -m "COMPX341-22A-A3 Commiting from CI/CD Pipeline"
git push
echo "Commit done"

cd assets
echo "(1) Build (Compile the application)"
npm install
npm run build
npm run start