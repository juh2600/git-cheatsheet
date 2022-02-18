### Anatomy of a Repository

In the introduction, I talked a bit about what things are, but not where they live. Git stores things in a few different areas, that all have specific purposes.

**The Workspace** is where your current, local version of the code lives. If you open a repository, open a file, and type things in, you're writing to your workspace. A lot of the most basic commands in Git are about moving things from your workspace to elsewhere.

**The Index** is, essentially, a list of all the files that Git cares about. This is where the term *tracked files* is introduced: things that the repository is tracking. The most common way to circumvent the index is to add file(s) to `.gitignore`, which tells the index (and subsequently the repository) to avoid tracking those file(s). For example, for configs that store API keys or passwords.

**The Local Repository** is the version of the repository on your machine. It's stored in a (hidden) directory named `.git`, and stores things like commits, branches, configurations, the stash, the index, and others. An important note is that a lot of things are kept in your repository that don't exist in your workspace: once you put something in the local repository, even if you delete the files and commits, it will still hang around in there. It's actually *very* difficult to truly lose something from git unless you know what you're doing, which is a good thing!

**The Upstream Repository** is the version of the repository that everyone else sees. This is often called the "remote" or "origin." For most purposes, it's stored somewhere magic that you don't care too much about. For other people to see your changes, you need to *push* them from the local repository to the upstream repository. For you to see others' changes, you need to *pull* them from the upstream.

**The Stash** is a part of the local repository that deserves special mention. It's a place where you can store (i.e., stash) things temporarily to go do other things. Not a lot of people know about it, but it's incredibly useful. If you are working on something and need to check out another part of the repo, you can stash your changes and come back to them later.
