if [ -z "$1" ] ; then
    echo "Please enter a commit message"
    # Sleep 1 sec so we can see the error message
    sleep 1s
    exit
fi

echo "Pipeline start"
# echo "(0) Push Update to Github"
# git add .
# git commit -m "COMPX341-22A-A3 Commiting from CI/CD Pipeline"
# git push
# echo "Commit done"

# cd assets
echo "(1) Install"
if npm install ; then
    echo "Successful install"

    # Run the Maintenance script if it is the final commit
    if [ "$2" == "final" ] ; then
        echo "Going to run Maintenance script"
        bash ./Maintenance.sh
        echo "Maintenance script Ended"
    fi
    
    echo "(2) Build. See whether we can build the program"
    if npm run build ; then
        cd ..
        git add .
        git commit -m "$1"
        git push
        cd assets
        echo "(3) Start: Run the application"
        npm run start
    else
        echo "Error: Failed to build, no commit shall be made"
    fi
else
    echo "Error: Unsucessful install"
fi
