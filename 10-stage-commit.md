# Commits

Git commits work like so:

  1. Create/edit/delete a file
  2. Stage the change
  3. Commit the change

## Before staging

To view all changed and staged files:

    git status

To view all unstaged changes (optionally just to one file):

    git diff [<filename>]

To view all staged changes (optionally just to one file):

    git diff --cached [<filename>]

To UNDO all changes to a file and return it to how it was the last time it was committed (potential for loss of data!):

    git restore <filename>

## Staging

To stage all changes within the current directory and its children (use with caution; consider splitting up commits based on their purposes):

    git add .

To stage all changes to a file:

    git add <filename>

To choose which changes to stage (this is an interactive process; specify an optional filename to limit the scope of your search):

    git add -p [<filename>]

To un-stage changes without undoing the changes on disk (will not lose data; note the `--cached`, very important):

    git rm --cached <filename>

## Committing

To commit all staged changes:

    git commit -m "describe git commands"

To commit all staged changes with a long message (will open $EDITOR; you can leave multiline messages there):

    git commit

To revert a commit:

> Just try not to get to this point; it's kinda scary and I still have trouble with it/haven't done it properly yet

## Reviewing

To view commit history:

    git log

To view the history of changes made by each commit (optionally just to one file):

    git log -p [<filename>]

