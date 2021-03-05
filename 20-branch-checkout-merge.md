# Branching and Merging

Git branches aren't really "branches"; they're labels that point to commits, and commits point to the commits before them (their parents). You can explore the history of the branch by travelling along the chain of commits. As you add commits, the head of the branch (the label) moves to point to the latest commit. (Reverting does not work by moving the head backward! A revert is a new commit with changes that undo the [un]desired commits.) Branch management works like so:

  1. There's a default branch (formerly `master`; new versions of Git use `main`)
  2. Create a branch (e.g. `new-branch`) to work on a feature or topic; this branch will start wherever you are when you create it (like...a tree branch)
  3. Make changes and commits to this new branch; the chain of commits between the `master` and the `new-branch` labels will grow longer. `new-branch` moves to keep up with each new commit
  4. "Check out" the old branch: switch over to that branch; all tracked files on disk will be changed to whatever they are on that branch
  5. Merge the `new-branch` into the current branch: all the changes made since the new branch diverged will be summed up and applied to the current state of master

NB: There is also an operation called "rebase". It serves a purpose similar to merge, but functions differently. I haven't used it in practice.

## Branching

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

## Reviewing

To list the commits in a branch:

    git log <branch-name>

To explore the repo at some point in history (DETACHED HEAD mode; you're floating around the DAG instead of keeping up with a branch):

    git checkout <commit-hash>

