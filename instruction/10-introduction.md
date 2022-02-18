# Introduction

This is meant to introduce some of the main terminology of Git. More details will come in later sections of this.

## Version Control Systems

If one looks up "what is Git," the first answer they see is that it's a distributed version control system. If they're not already accustomed to version control, then this sentence is frustratingly opaque. Let's step through the vocabulary one word at a time to break it down.

### Version Control

It happens with a lot of projects, software or otherwise, that multiple versions want to be maintained. Software releases might have the familiar v1.3.37 tag, documents might undergo revisions, the works. Version control happens by necessity whenever someone is maintaining multiple versions of something in any capacity. So from this, we can get that Git is a tool that helps maintain versions of software, *somehow*.

### Distributed

When we say "distributed" in computing contexts, we mean that there are multiple components working together across multiple machines. The idea is to make a network of computers work as a single computer. From here, the idea of a distributed version control might make more sense: if multiple people are all maintaining their own versions, how are they kept? How do we track who is doing what? What happens if people happen to conflict, or write two "up-to-date" versions of the same document? These are the types of problems that Git solves.

## Git

So, Git means that I have versions of software, and that multiple people can work on versions at once. How does it do that? What kinds of operations are supported?

### Commits

The basic usage of Git is in a repository, which stores objects (code, configuration, documents, otherwise) to be tracked. You're reading this on one of those. The fundamental unit of a git repository is a commit. A commit is, effectively, a version of the objects that the repository tracks. Commmits are assigned a 128-bit name on creation, and store in them a few things. One is a pointer to the previous commit, its *parent*. Another is *deltas*, or specific file changes (often line insertions and deletions) that happened in this version. Commits can also receive other types of naming, such as the usual commit message, and the rarer *tag*.

### Merges

Often, you don't want your commit to just exist in a vacuum, you want to share it with people. To do this, you *push* the commit, which is effectively telling the repository "Hey! This file changed! Track it!" The remote branch will then take the commits from your local branch and *merge* it into itself. Ninety percent of the time this works fine, but occasionally you'll get a *merge conflict* when the most up-to-date versions are... in conflict.
