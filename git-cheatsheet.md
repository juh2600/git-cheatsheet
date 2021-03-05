# Commits

Git commits work like so:

  1. Create/edit/delete a file
  2. Stage the change
  3. Commit the change

To view all changed and staged files:

    git status

To view all unstaged changes (optionally just to one file):

    git diff [<filename>]

To view all staged changes (optionally just to one file):

    git diff --cached [<filename>]

To UNDO all changes to a file and return it to how it was the last time it was committed (potential for loss of data!):

    git restore <filename>

--------------------------------------------------------------------------------

To stage all changes within the current directory and its children (use with caution; consider splitting up commits based on their purposes):

    git add .

To stage all changes to a file:

    git add <filename>

To choose which changes to stage (this is an interactive process; specify an optional filename to limit the scope of your search):

    git add -p [<filename>]

To un-stage changes without undoing the changes on disk (will not lose data; note the `--cached`, very important):

    git rm --cached <filename>

--------------------------------------------------------------------------------

To commit all staged changes:

    git commit -m "describe git commands"

To commit all staged changes with a long message (will open $EDITOR; you can leave multiline messages there):

    git commit

To revert a commit:

> Just try not to get to this point; it's kinda scary and I still have trouble with it/haven't done it properly yet

To view commit history:

    git log

To view the history of changes made by each commit (optionally just to one file):

    git log -p [<filename>]

# Branching and Merging

Git branches aren't really "branches"; they're labels that point to commits, and commits point to the commits before them (their parents). You can explore the history of the branch by travelling along the chain of commits. As you add commits, the head of the branch (the label) moves to point to the latest commit. (Reverting does not work by moving the head backward! A revert is a new commit with changes that undo the [un]desired commits.) Branch management works like so:

  1. There's a default branch (formerly `master`; new versions of Git use `main`)
  2. Create a branch (e.g. `new-branch`) to work on a feature or topic; this branch will start wherever you are when you create it (like...a tree branch)
  3. Make changes and commits to this new branch; the chain of commits between the `master` and the `new-branch` labels will grow longer. `new-branch` moves to keep up with each new commit
  4. "Check out" the old branch: switch over to that branch; all tracked files on disk will be changed to whatever they are on that branch
  5. Merge the `new-branch` into the current branch: all the changes made since the new branch diverged will be summed up and applied to the current state of master

NB: There is also an operation called "rebase". It serves a purpose similar to merge, but functions differently. I haven't used it in practice.

--------------------------------------------------------------------------------

To list currently available branches:

    git branch

To create a new branch:

    git checkout -b <branch-name>

To switch to an existing branch:

    git checkout <branch-name>

To delete a branch (keep in mind, a "branch" is just a pointer to a commit):

    git branch -D <branch-name>

To merge another branch into this one (both labels will now point to the same commit, although they can diverge again right after):

    git merge <branch-name>

--------------------------------------------------------------------------------

To list the commits in a branch:

    git log <branch-name>

To explore the repo at some point in history (DETACHED HEAD mode; you're floating around the DAG instead of keeping up with a branch):

    git checkout <commit-hash>

# Remotes

Git remotes let you back up and share a repository using a remote server. They work like so:

  1. A local repo exists on your hard drive
  2. A remote repo exists in The Cloud (could be a company internal server)
  3. A local repo has a list of remotes, which consist of a name and a URL
  4. When a local repo has just one remote, it is typically named "origin"

If the remote repo exists first:

  1. Clone the remote repo to obtain a local copy

If the local repo exists first:

  1. Create the remote repo using whatever system your platform requires (e.g. the New Repo button on GitHub)
  2. Add the remote to the local repo's list

To share work:
  1. Check out the appropriate branch (whatever you want to eventually push)
  2. Commit or stash any changes
  3. Pull changes from the remote
    1. Fetch changes from the remote
    2. Merge the remote's changes into your local branch
      1. Resolve any merge conflicts by editing the affected files
      2. Commit the changes to complete the merge
  4. Push changes to the remote
  5. If you stashed changes in step 2, pop the stash to restore them

Step 3 is usually automatic. There is seldom a reason to perform 3.1 and 3.2 separately. If the pull fails due to merge conflicts, you'll be left at 3.2.1. If you attempt to push before pulling, and the remote has changes that the local copy doesn't have merged, then the remote will reject the push angrily. URLs for remote repositories often look like one of these:

    SSH: git@github.com:username/reponame.git
    HTTPS: https://github.com/username/reponame.git

--------------------------------------------------------------------------------

To clone a repo:

    git clone <url>

--------------------------------------------------------------------------------

To list remotes:

    git remote

To list the configuration of a remote (if this fails, then the remote is not configured correctly; ensure that you have permission to access the remote):

    git remote show <remote-name>

To add a remote:

    git remote add <remote-name> <url>

To remove a remote:

    git remote remove <remote-name>

--------------------------------------------------------------------------------

To stash changes (like a temporary commit; this saves changes to be re-applied later and resets the files on disk to the latest commit):

    git stash

To apply the latest stash (restore changes):

    git stash pop

--------------------------------------------------------------------------------

If the following commands ask you to use an option similar to "--set-upstream", follow those directions that time. This is normal the first time a branch is pushed or pulled.

To pull (automatic fetch + merge):

    git pull

To fetch changes:

    git fetch

To merge the changes from the remote's copy of this branch into the local copy of this branch:

    git merge FETCH_HEAD

To push changes:

    git push

