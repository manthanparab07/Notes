> Linux For Developers

### Stream Editor (sed)

- Make substitutions and other modifications in files and in streamed output.

```bash
sed s/pig/cow/g filename
sed -e s/"pig"/"cow"/g -e s/"dog"/"cat"/g < file > newFile
ls -l | sed s/"root"/"admin"/g
```

- Multiple String can be edited using **-e**

- Global replacement using **-g**

  ```bash
  cat scriptfile
  
  s/pig/cow/g
  s/dog/cat/g
  s/frog/toad/g
  
  sed -f scriptfile < file > newFile # subsitute using script
  ```

   

- | Command                                    | Usage                                                 |
  | ------------------------------------------ | ----------------------------------------------------- |
  | **sed s/pattern/replace_string/ file**     | Substitute first string occurrence in every line      |
  | **sed s/pattern/replace_string/g file**    | Substitute all string occurrences in every line       |
  | **sed 1,3s/pattern/replace_string/g file** | Substitute all string occurrences in a range of lines |
  | **sed -i s/pattern/replace_string/g file** | Save changes for string substitution in the same file |

### AWK

- Advance File Utilities

- | Command                    | <header>                                               |
  | -------------------------- | ------------------------------------------------------ |
  | **awk 'command'  file**    | Specify a command directly at the command line         |
  | **awk -f scriptfile file** | Specify a file that contains the script to be executed |

  

- The input file is read one line at a time, and, for each line, **awk** matches the given pattern in the given order and performs the requested action. The **-F** option allows you to specify a particular field separator character. For example, the **/etc/passwd** file uses "**:**" to separate the fields, so the **-F:** option is used with the **/etc/passwd** file.

- | Command                                   | Usage                                                        |
  | ----------------------------------------- | ------------------------------------------------------------ |
  | **awk '{ print $0 }' /etc/passwd**        | Print entire file                                            |
  | **awk -F: '{ print $1 }' /etc/passwd**    | Print first field (column) of every line, separated by a space |
  | **awk -F: '{ print $1 $7 }' /etc/passwd** | Print first and seventh field of every line                  |

### Sort

- **sort** is used to rearrange the lines of a text file  either in ascending or descending order, according to a sort key. You  can also sort by particular fields of a file. 

- | Syntax                      | Usage                                                        |
  | --------------------------- | ------------------------------------------------------------ |
  | **sort **                   | Sort the lines in the specified file, according to the characters at the beginning of each line |
  | **cat file1 file2 \| sort** | Combine the two files, then sort the lines and display the output on the terminal |
  | **sort -r **                | Sort the lines in reverse order                              |
  | **sort -k 3 **              | Sort the lines by the 3rd field on each line instead of the beginning |

- sort with **-u** works as **uniq**.



### Sort 

- Only remove multiple entries from consecutive lines.

### Paste

- **paste** can be used to combine fields (such as name or  phone number) from different files, as well as combine lines from  multiple files. 

- ```bash
  paste -d, file1 file2
  ```

  

### Types of File

-   **-** Normal File
-   Symbolic Link (**l**)
-   Named Pipes(**p**)
    -   Inter-process communication
-   Unix Socket(**s**)
    -   Networking

### Static Libraries

-   Have extension **.a** 
-   When a program is compiled, full copies of any loaded library routines are incorporated as part of the executable.
-   Increases the size of executable but provides protection from changes in the library which might effect the application unlike shared libraries.
-   Application with static libraries are self contained with least no of dependencies.
-   Application load time increases.

### Shared Libraries

-   A single copy of a shared library can be used by many applications at  once; thus, both executable sizes and application load time are reduced.
-   Shared libraries have the extension **.so**. 