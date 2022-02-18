# Remotes

Git remotes let you back up and share a repository using a remote server. They work like so:

  1. A local repo exists on your hard drive
  2. A remote repo exists in The Cloud (could be a company internal server)
  3. A local repo has a list of remotes, which consist of a name and a URL
  4. When a local repo has just one remote, it is typically named `origin`

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

## Configuring remotes

### Cloning

To clone a repo:

    git clone <url>

### Editing remotes

To list remotes:

    git remote

To list the configuration of a remote (if this fails, then the remote is not configured correctly; ensure that you have permission to access the remote):

    git remote show <remote-name>

To add a remote:

    git remote add <remote-name> <url>

To remove a remote:

    git remote remove <remote-name>

## Stashing

To stash changes (like a temporary commit; this saves changes to be re-applied later and resets the files on disk to the latest commit):

    git stash

To apply the latest stash (restore changes):

    git stash pop

## Pulling and pushing

If the following commands ask you to use an option similar to `--set-upstream`, follow those directions that time. This is normal the first time a branch is pushed or pulled.

To pull (automatic fetch + merge):

    git pull

To fetch changes:

    git fetch

To merge the changes from the remote's copy of this branch into the local copy of this branch:

    git merge FETCH_HEAD

To push changes:

    git push
