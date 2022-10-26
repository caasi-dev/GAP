#!/bin/bash
. vars


# define all your git project folders in this array
folders=("/data/dev/dots" "/data/dev/TEST" "/data/dev/WORK/common-ground/")

# loop each folder and perform checks if there is modified
# work in it, and commit and push if necessary
# only current checked out branch currently supported
for f in "${folders[@]}"
    do
        cd "$f"
        echo -e "${Green}Checking $f for changes...${NC}"
        ADDED=`git status --porcelain 2>/dev/null| grep "^M" | wc -l`
        NOTCOMMITEDNOTADDED=`git status --porcelain 2>/dev/null| grep "^ M" | wc -l`
        UNCOMMITED=`git status --porcelain 2>/dev/null| egrep "^(M| M)" | wc -l`
        UNTRACKED=`git status --porcelain 2>/dev/null| grep "^??" | wc -l`

        if [[ "$UNCOMMITED" -gt 0 ]] || [[ "$ADDED" -gt 0 ]] || [[ "$UNCOMMITED" -gt 0 ]] || [[ "$UNTRACKED" -gt 0 ]]; then
            echo -e "\n${X_MARK} we need to commit\n"
            
            # There may be an instance where no remote is configured
            # Handle it here

            git add .
            git commit -m "auto commit"
            git push
            echo -e "\n${CHECK_MARK} ALL PUSHED \n"
        else
            echo -e "\n${CHECK_MARK} Working directory is clean. No action taken\n"
        fi

        echo "______________________________"
    done

