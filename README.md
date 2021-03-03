### **-GIT BASICS WORKSHOP-**

**1.** `Git basic Three Trees workflow`

![Image description](./assets/three_trees.png)

#### Our local repository consists of three main parts maintained by _git_. The first one is our _Working Direcotry_ which holds the actual files that we can change and that are accessible to our IDE. _Working Direcotry_ is basically particular version or snapshot of your project. The second one is the _Index_ which is staging area where changed files are prepared to be commit objects. Files that are commited and files that are in staging area and saved in _.git_ directory. _HEAD_ is the pointer to the current checkout branch and it points to the last commit

#### So how these three parts correlates to one another. First when we change some files and do _git status_ it will show as those files painted in red which tells as that there is difference between files in out _Working Directory_ and the files in the _Index_ which are files from particular commit most commonly from the last commit. Next, when we do _git add_ we add those files in staging are which are then ready to be commited. After we commit them that commit object that is created will be a new reference that _HEAD_ is pointing at

---

**2.** `$ git init`

#### Command for initializing a new empty git repository

---

**3.** `$ git clone <url-of-remote-repo>`

#### Command for downloading an existing Git repository to our local machine

---

**4.** `git-ignore`

#### `git-ignore` is the file where we can specify all folders and files that we don't want to track and that Git should ignore

---

**5.** `$ git add`

#### git add is the command for adding files to the staging area. We can use`$ git add .` to add all changed files or we can use`$ git add <path-to-file>` to add specific file to staging area

---

**6.** `$ git status`

### git status is the command that can be used for see summary of all files that we have changed

---

**7.** `$ git commit`

#### git commit is the command for creating commit object (and associating meaningful log message that should describe the changes) that will live inside `.git` directory

#### Use `$ git commit -m` for adding commit message inline without opening editor

#### Use `$ git commit -a -m` to add changed files to staging area and to write commit message, (NOTE: `-a` argument will not add newly created files it will add only already existing changed files to staging area)

---

**7.1.** `rules of good commit message`

<https://gist.github.com/julienbourdeau/e605e4b8b47da97c249a0f72598529c8>

---

**8.** `$ git commit --amend`

#### git commit --amend is the command that we can use to modify the most recent commit. It lets you combine staged changes with the previous commit instead of creating an entirely new commit

#### We can use`$ git commit --amend -m 'git-message'` or`git commit --amend --no-edit` to commit changed files with previous commit message

---

**9.** `$ git rm --cached <path-to-the-file>`

#### This is useful command when we are in situation where we have files in staging area and we don't wont to include it into our commit

---

**10.** `$ git clean`

#### `git clean` is the command for deleting untracked files from our working directory

`$ git clean -f` - -f --force (Force is required unless in the git configuration variable clean.requireForce option is set to false)

`$ git clean -d` - -d is to include directories

---

**11.** `$ git branch`

#### git branch is command for working with Git branches

`$ git branch` - command for listing local branches

`$ git branch -a` - command to see all branches local and remote ones

`$ git branch -d <branch-name>` - command for deleting local branch

`$ git branch origin --delete <branch-name>` - command for deleting remote branch

`$ git branch -m <old-branch-name> <new-branch-name>` - command to rename local branch

---

**12.** `$ git checkout`

#### `git checkout` is the command for switching branches or restoring working tree files

`$ git checkout -b <branch-name>` - `-b` is for create new branch and then checkout to that branch

`$ git checkout -- .` - usefull command to discard all changes made in all files, we can use `git checkout -- <file-name>` to discard changes in specific file

`$ git checkout -` - useful command for switching to last checked out branch

---

**13.** `$ git fetch`

#### `git fetch` is command that downloads commits, branches, files from remote repository in our local repo, but it will not update our local repository state leaving our current work intact

---

**14.** `$ git merge`

#### `git merge` is command for integrating changes that have been made in remote or local branch into your current branch by creating new `merge commit`

`git merge <branch name>` where branch-name is the name of the branch that will be merged into the receiving branch.

#### There are several merge strategies but two main merge strateegies are `Fast Forward` and `Recursive Merge`

**14.1.** **_Fast Forward_**

#### With `Fast Forward` merge git history is straight line without extra merge commit. This strategies is default one (when possible) and it happens when you create new branch make some commits on that branch and by the time you are ready to merge those commits there is no commits on master.

![Image description](./assets/before-after-merge.png)

**14.2.** **_Recursive merge_**

#### Recursive occurs when there is no linear path between the branches.If you've created a feature branch from the master branch, you made some new commits and now you want to merge it. But, the difference is that in meantime, someone updated the master. So, in order to merge the branches, Git has to create a new commit in which the changes are combined. At this moment, a conflict can occur. Conflicts occur when both of the branches changed a same block of code and Git needs your help to put the changes together

**14.3** **_git merge --squash_**

#### _squash_ merging is merge option that gives as a way to put together all commits made on some branch into single commit

`$ git checkout master`

`$ git merge --squash <branch-name>`

`$ git commit`

This will take all the commits from the _branch-name_ branch, and add them to a single commit on the _master_ branch

![Image description](./assets/no-ff-merge.png)

---

**15.** `$ git pull`

#### `git pull` is the command that is used to fetch content from remote repository and immediately update our local repository. It is combination of `git fetch` and `git merge`

---

**16.** `$ git push`

#### `git push` is the command for uploading local changes that we have made to a remote repositiry

`$ git push origin <branch-name>` - is the command that we can use when we want to push branch to the remote repository. _origin_ is essentially shorthand for the remote repository's URL. So, to push your changes to the remote repository, you could've used either the command: git push git@github.com:git/git.git yourbranchname or git push origin yourbranchname

`$ git push --force` - is the command that we can use to make the remote repository's branch match your local one. Only time where we should use this command is when we realize that commits that we shared to remote are not quite right and we want to fix the using `$ git commit --amend` command. When doing push force we need to be absolutely certain that none of our colleagues have pulled commits before using --force option

`$ git push --force-with-lease` => it will force the push with additional check if someone else did some changes on that branch

---

**17.** `Pull Requests`

_Example_:
53 - Add RookieService to handle all checks and calculation related to rookie

Summary of code changes:

1. Added RookieService class and implemented functionality to calculate remaining and current vacation days
2. Deleted unused code
3. Improved naming and fix typos

RookieService should update remaining vacation days and current vacation days for employees that are employed less than 6 months. For all other employees, the implementation should remain the same.

To test, set employment date to less than 6 months and try to add request view dashboard.

---

**18.** `$ git stash`

#### `git stash` command offers us option to temporarily store our uncommitted local changes, and switch to work on another branch

`$ git stash list` => shows list of all existing stashes

`$ git stash` => it will stash the changes in the memory

`$ git stash save <stash-message>` => atash changes with message

`$ git stash pop` => will take stashed change and also remove it from stash

`$ git stash apply` => will take stashed change but also keep it in stash

`$ git stash clean` => remove all stashed changes

---

**19.** `$ git log`

#### `$ git log` is command that allows as to review and to read history of all commits that are made in repository

`$ git log` => outputs the most basic log

`$ git log components` => output that is restricted to only specific directory

`$ git log feature` => output that is restricted to specific branch

`$ git log --oneline` => outputs history formated in one line

`$ git log --author` => outputs all commits by specific author

---

**20.** `$ git reset`

#### `git reset` is command for undoing changes. There is three forms of git reset, `--soft`, `--mixed`, `--hard`

`$ git reset --soft HEAD^` => will reset the last commit and put the changes in staged area ready to be committed

`$ git reset --mixed HEAD^` => will reset the last commit so that all changed files are preserved but not marked for commit (not in staging area). This is default git reset option

`$ git reset --hard HEAD^` => will completely remove last commit and all changes will be discarded

---

**21.** `$ git reflog`

#### Reflog is just the log of all changes that you've made (Git keeps this logs 90 days by default)

---

## Usefull sites

<https://ohshitgit.com/>

<https://devhints.io/git-log>
