>   ## GIT

-   #### Distributed Version Control Systems 

    -   Each Developer has its own copy of the project source code with full history.
    -   First Phase is Cloning of repository or creating it.

-   ##### Snapshots, not difference

    -   Git thinks of it data as a series of snapshots and with every commit it stores a reference to the snapshot.

    -   ##### Stream of snapshots

-   ##### Three States

    -   Git has three main states the file rests in

        1.  ##### Modified ( In Working Directory )

        2.  ##### Staged ( Staging Area )

        3.  ##### Committed ( Git Directory )

    -   ##### Modified means that you have changed your file but not have committed to the database.

    -   ##### Staged means you marked the modified file and it will be added into the next commit snapshot

    -   ##### Committed means that the data is safely stored in database.

-   ##### Working Directory 

    -   There are two type of file in working directory	

        1.  ##### 	Tracked Files

            -   Files that were in the last snapshot.
            -   These files can be **modified, unmodified or staged**.

        2.  ##### Untracked files

            -   Files that are not in the last snapshot or in the staging area.

    -   Whenever we clone a repository all the files in the directory are **tracked and unmodified.**

| Commands                   | Meaning                                                      |
| :------------------------- | :----------------------------------------------------------- |
| **git init**               | initialises an git repository                                |
| **git  add filename**      | starts tracking filename ; add files to staging area         |
| **git commit**             | adds snapshot to database                                    |
| **git commit -a**          | commits directly by skipping staged                          |
| **git commit <br> –amend** | Redo previous commit and overwriting previous commit if additional files or changes need to added |
| **git clone**              | adds the repository on your local repository                 |
| **git status**             | display’s the state of all files (tracked and Untracked)     |

**git commit --amend** : takes your staging area and uses it for commit. Used in case some files were not added in the commit and the commit is changed to new one removing previous commit.

### Ignoring Files

-   Some files can be explicitly prevented from being tracked by adding them in the **.gitignore** file

Content of **gitignore**

|     Types      | Meaning                                                      |
| :------------: | ------------------------------------------------------------ |
|   ***.[oa]**   | Ignore all the files that end with either **.o** or **.a**   |
|  **\#** hello  | comment in **.gitignore**                                    |
|  **!** lib.a   | do track lib.a even if all **.a** files are ignored          |
|     /TODO      | ignore all TODO **file** in current directory                |
|     build/     | ignore all the files in build **directory**                  |
| doc/\**/\*.pdf | ignore all .pdf files in the doc/ directory and its sub-directory |

| Command               | Meaning                                                 |
| --------------------- | ------------------------------------------------------- |
| **git diff**          | compares files from working directory and staging area. |
| **git diff -–staged** | compares files from staged and last commit              |

#### Removing Files

-   To remove a file from Git, you have to remove it from your **tracked file (i.e staging area)** and then commit it.
-   **git rm filename**  removes the file from your working directory and also doesn’t show them as Untracked files next time.
-   If you remove the file using **rm**  command then it will only remove from the working directory, it will show up in the **Changes not staged for commit (upstaged area)** on git status output.

| Command             | Equivalent Command                         |
| ------------------- | ------------------------------------------ |
| **git rm filename** | **rm filename**                            |
|                     | **git add filename** ( need to be staged ) |
| git commit          | git commit                                 |

| Command                     | Meaning                                                      |
| --------------------------- | ------------------------------------------------------------ |
| **git rm —cached filename** | keeps the file in **working directory ** but remove from **staging area** |

#### Moving Files

-   #### Git does not explicitly track file movement.

-   #### If file is renamed no metadata is stored in Git to tell that a file is renamed.

| Command             | Equivalent Command |
| ------------------- | ------------------ |
| **git mv old new ** | **mv old new**     |
|                     | **git rm old**     |
|                     | **git add new **   |
|                     |                    |

- Using normal mv will show **old deleted and new file added ** in git status output whereas using **git mv old new** will show file moved message which is more accurate indication of operation. 

### Viewing Commit History

| Command               | Meaning                                                      |
| --------------------- | ------------------------------------------------------------ |
| **git log**           | list of commits  in reverse order i.e latest to oldest       |
| **git log -–patch**   | difference **patch output** introduced in each commit.       |
| **git log –-stat**    | displays an additional info about changes i.e deletions      |
| **git log --pretty=** | **oneline**  - display sha-1 and commit name <br>**format:” Different Format ”** |

#### Types of Format  git log –pretty=format:

| Options | Description of Output                                  |
| ------- | ------------------------------------------------------ |
| **%H**  | Commit hash                                            |
| **%h**  | Abbreviated commit hash ( first six characters of sha) |
| **%an** | Author name                                            |
| **%ae** | Author email                                           |
| **%ad** | Author date (format respects the –date=option)         |
| **%ar** | Author date, relative                                  |
| **%cn** | Committer date                                         |
| **%ce** | Committer email                                        |
| **%cd** | Committer date                                         |
| **%cr** | Committer date,relative                                |
| **%s**  | Subject                                                |

-   Author is the person which actually contributed to work whereas Committer is the person which commits the work done by author in the main project.
-   Ex. Patch Send by Kernel Developer to maintainer

##### Specify Time Frame and author in git log

| Command                     | Meaning                          |
| --------------------------- | -------------------------------- |
| **--author='author_name' ** | Specify author name              |
| **--since='2008-10-01'**    | Commit log after specified date  |
| **--before='2008-11-01'**   | Commit log before specified data |

#### Unstaging a Staged File 

-   If we changed two or more files and we staged them all then a single commit would show changed from multiple files.

-   But if we want single commit for each file we need to **remove the file from staging area**.

    ```bash
    git reset HEAD fileName
    ```

-   This will unstage the file from staging area.

#### Unmodifying a Modified File

-   **git checkout -- filename** allows us to discard all the changes and revert the file back to what it was when last committed.

#### Collaborating using Git 

-   **Managing Remotes**

    -   Collaborating using git involves managing **remote** repositories and how to push pull operations that are required to add changes reflect to remote repository.

    -   If the repository is **cloned** then we can see the remote which is **origin**

        ```bash
        git remote -v
        ```

        -   It is the default name that Git gives to the server you cloned from.
        -   A repository can have **multiple remotes ** indicating multiple collaborators working on the project.

    -   **Adding Remote Repositories**

        -   ```bash
            git remote add <shortname> url	
            ```

    -   **Fetching Changes **

        -   Fetching all information from another remote

        -   This will create a new branch from that remote

        -   ```bash
            git fetch shortname
            ```

        -   Later on this branch can be merged into main master branch.

    -   **Fetching and Pulling from Your Remotes**

        -   ```bash
            git fetch <remote>
            ```

        -   We  have references to all the branches from that remote, which you can merge in or inspect at any time.

        -   Accessing them can be done through **remote/master**

Difference between **git pull** and **git fetch**

-   **git fetch** automatically creates a new branch for the changes that are being fetched .Now the user has to decide whether to merge the changes or inspect.

-   **git pull** automatically merges the remote branch from the remote repository into your master branch if no error occurs.

    -   **Pushing to Your Remotes**

        -   When you have your project at a point that you want to share, you have to push it upstream.

        -   ```bash
            git push remote master
            ```

    -   **Renaming and Removing Remotes**

        -   ```bash
            git remote rename new old
            ```

    -   **Removing a Remote**

        -   ```bash
            git remote remove <remote>
            ```

            

#### Tagging 

-   It allows us to tag a specific point in  a repository's history as being important.
-   It helps to identify and mark specific versions. 

| Command                  | Meaning                                             |
| ------------------------ | --------------------------------------------------- |
| **git tag**              | lists all the tags                                  |
| **git tag -l "pattern"** | list all tags that can be represented using pattern |
| **git tag tagname**      | adds a lightweight tag if not exists                |

##### Creating tags

-   Git supports two types of tags: **lightweight and annotated.**
-   A **lightweight** tag is very much like a branch that doesn’t change — it’s just a pointer to a specific commit.
-   **Annotated** tags, however, are stored as full objects in the Git database. containing it consist of the tagger name, email, and date; have a tagging message.

| Commands                                | Meaning                           |
| --------------------------------------- | --------------------------------- |
| **git tag -a v1.2 -m "My Version 1.2"** | creates an annotated tag **v1.2** |
| **git show **                           | list and shows tag data           |
| **git show tagname**                    | display tag data for tagname      |
| **git tag -d tagname**                  | deletes the tag                   |

##### Tagging previous commits

| Command                      | Meaning                       |
| ---------------------------- | ----------------------------- |
| **git tag -a tagname 99ae0** | creates a tag for that commit |

Git tags are not transferred using **git push**

```bash
git push remote <tagname>
git push remote --tags	# pushes all the tags
git push origin --delete <tagname> # deletes tag from remote
```

