# Git Commands

# Define your name and e-mail
git config --global user.name "apkap83"
git config --global user.email "ap.kapetanios@gmail.com"

# Retrieve config
git config user.name
git config user.email

# Set VS Code as default editor
git config --global core.editor "code --wait"

# Add to staged area and commit in one command
git commit -a -m "Message"

# Forgot to add something minor in the previous commit - add it in the latest commit
git commmit --amend

# Remove a file that should not be committed
git restore --staged path/to/unwanted_file
    #Now commit again, you can even re-use the same commit message:
    git commit -c ORIG_HEAD  

#### Branches ####

    # List all Branches
    git branch

    # Creating Branch
    git branch <branch-name>

    # Switch to another Branch # 1st way
    git switch <branch-name>

    # Switch to another Branch # 2nd way
    git checkout <branch-name>

    # Create branch and switch in one command
    git switch -c <new branch-name>   OR   git checkout -b <new-branch-name>

    # If we have conflicting changes, we will not be able to switch branch
    # if we do not have conflicting changes (new file), we will be able to switch branch

    # Delete a branch (have to be away from the branch)
    git branch -d <branch-name> -OR Force due to not merged yet- git branch -D <branch-name>

    # Move/Rename branch (have to be in the branch)
    git branch -m <new-branch-name>

### DIFF ###

    # Compares Working Directory and Staging Area
    git diff [filenames]

    # Compares Stage and HEAD
    # "Show me what will be included in my commit if I run git commit right now"
    git diff --staged [filenames]

    # Compares Working Directory and HEAD
    git diff HEAD [filenames]

    # Compares 2 different commits
    git diff commit1..commit2 -OR- commit1 commit2

    # Compare 2 different Branches
    git diff branch1..branch2 -OR- git diff branch1 branch2

### GIT STASH ###

    # Running git stash will take all uncommitted changes (staged and unstaged)
    # and stash them, reverting the changes in your working copy.
    git stash -OR- git stash save

    # View all stashses
    git stash list

    # Remove the most recently stashed changes in your stash and re-apply them to your
    # working Directory 
    git stash pop

    # Apply whatever is stashed away, without removing it from the stash. This can be useful
    # if you want to apply stashed changes to multiple branches
    git stash apply
    -OR- git stash apply stash@{0}  # When you have multiple stashes

    # Delete a particular stash
    git stash drop stash@{0}

    # Clear all stash
    git stash clear

## Undoing Changes & Time Travelling

    # We can use checkout to create branches (-b), switch to new branches, restore files,
    # and undo history!

    # After checking out a particular commit we are in detached head mode and from there we
    # can create a new branch...

    # Discarding Changes
    # To revert a file back to whatever it looked like when you last committed
    git checkout HEAD <filename> 
    -OR- git restore <file-name> # --> Uses HEAD as the default source
    git checkout -- <filename>

    ## Undoing commits
    # Suppose you've just made a couple of commits on the master branch, but you actually meant
    # to make them on a separate branch instead.
    git reset <commit id> -afterwards you can create a new branch with those changes- git switch -c "NewBranch"

    # Undo commits AND the actual changes in current directory
    git reset --hard <commit id>

    ## Git revert is similar to git reset in that they both "undo"
    ## changes, but they accomplish it in different ways.
    ## git reset actually moves the branch pointer backwards, eliminating commits
    ## git revert instead creates a brand new commit which reverses/undos the changes
    ## from a commit. Because it results in a new commit, you will be prompted to enter
    ## a commit message
    git revert c958161

    # If you want to reverse some commits that other people already have on their machines, you should use revert
    # If you want to reverse commits that you haven't shared with others, use reset and no one will ever know!
    