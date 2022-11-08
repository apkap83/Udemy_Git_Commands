# Git Commands

# Define your name and e-mail
git config --global user.name "apkap83"
git config --global user.email "ap.kapetanios@gmail.com"

# Retrieve config
git config user.name
git config user.email

# TLS Verification True
git config --global http.sslVerify true

# Allow git to talk to Windows's own certificate store
git config --global http.sslBackend schannel

# Set VS Code as default editor
git config --global core.editor "code --wait"

# Add to staged area and commit in one command
git commit -a -m "Message"

# Forgot to add something minor in the previous commit - add it in the latest commit
git commmit --amend

# If you want to remove the file from the Git repository and the filesystem, use:
git rm file1.txt
git commit -m "remove file1.txt"

# But if you want to remove the file only from the Git repository and not remove it from the filesystem, use:
git rm --cached file1.txt
git commit -m "remove file1.txt"

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

    # Remove a file from staging area
    git restore --staged path/to/unwanted_file

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

## GitHub
    # Show remote repositories config in current/local repositories
    git remote -v

    # Add remote origin
    git remote add origin https://....

    # origin is just a name that you can rename
    git remote rename <old> <new>

    # Also you can remove remote origin
    git remote remove <name>

    # Push master branch to origin
    git push origin master

    # Push a branch and rename the uploaded branch
    git push origin pancake:waffle

   # git push -u origin master --> git push (associates local/master with origin/master)  

   # Show all remote branches
   git branch -r

   # Switch to a remote branch 
   # Makes a local branch and sets it up to track the remote branch
   git switch origin/puppies
   
   # Old way to do the same thing as above
   git checkout --track origin/puppies

    # Fetching allows us to download changes from a remote repository, but those changes
    # will not be automatically integrated in our working files
    # It lets you see what others have been working on, without having to merge those changes
    # into your local repo.
    git fetch [<origin>] [<branch>]


    # Pull is another command we can use to retrieve changes from a remote repository.
    # Unlike fetch, pull actually updates our HEAD branch with whatever changes are
    # retrieved from the remote.
    # "go and download data from Github AND immediately update my local repo with those changes"
    # git pull = git fetch + git merge
    
    # Just like git merge, it matters WHERE we run this command from. Whatever branch we run it from
    # is where the changes will be merged into.
    git pull [<origin>] [<branch>]

## Rebase

    # There are two main ways to use git rebase command:
        # - as an alternative to merging
        # - as a cleanup tool
    git switch feature
    git rebase master

    # Golden Rule
    # When NOT to Rebase
    # Never rebase commits that have been shared with others. If you have already pushed commits up to Github.. 
    # DO NOT rebase them unless you are positive no one on the team is using those commits

# Interactive Rebase
    
    # Running git rebase with the -i option will enter the Interactive
    # mode, which allows to edit commits, add files, drop commits etc.
    # Note that we need to specify how far back we want to rewrite commits.
    # Also, notice that we are not rebasing onto another branch.
    # Instead, we are rebasing a series of commits onto the HEAD they are
    # currently are based on.
    git rebase -i HEAD~4


