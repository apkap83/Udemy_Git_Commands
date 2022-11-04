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
    git branch -d <branch-name>   OR Force due to not merged yet   git branc -D <branch-name>

    # Move/Rename branch (have to be in the branch)
    git branch -m <new-branch-name>


    