>    ### Vim Cheat Sheet

|      Command      | Descriptions                                                 |
| :---------------: | :----------------------------------------------------------- |
|        :e!        | discard all changes and return back to the saved state from file |
|        :q!        | discard all changes and quit                                 |
|                   |                                                              |
|    :w filename    | save the buffer into filename                                |
|   :w! filename    | save the buffer into filename even if file already exists    |
|                   |                                                              |
|      h j k l      | move the cursor left down up right                           |
|      [n] h l      | move the cursor n characters left or right                   |
|      [n] j k      | move the cursor n characters below or above                  |
|                   |                                                              |
|        0 $        | move the cursor at the beginning and end of the buffer       |
|    [n] w [n] b    | move forward and backward with considering punctuation (.,?) |
|    [n] W [n]B     | move forward and backward without considering punctuation    |
|                   |                                                              |
|      set nu       | display line number while using vim                          |
|       [n] G       | move the cursor to line **n** from beginning default end of file |
|         g         | move the cursor to the beginning of the file                 |
|                   |                                                              |
|      i a c d      | insert append copy delete                                    |
|         I         | Insert text at the beginning of the file                     |
|         A         | Append text at the end of the line                           |
|                   |                                                              |
|    c[n]w c[n]b    | delete words from cursor till before or backward             |
|                   |                                                              |
|                   | **(command) (text object)**                                  |
|                   |                                                              |
|       cw cb       | copy and remove   word from cursor forward or backward       |
|       yw yb       | copy   word from cursor forward or backward                  |
|       dw db       | delete   word from cursor forward or backward                |
|                   |                                                              |
|                   | Ex: c2b 2cb y2b d2b                                          |
|                   |                                                              |
|       cc C        | Replace the current line [ **dd + i** ]                      |
|       r[c]        | replace the current character with **c**                     |
|         R         | replace the character as you type                            |
|                   |                                                              |
|       [n]~        | Change case of characters                                    |
|       [n]dd       | delete n lines irrespective of cursor position               |
|         D         | delete the text from the cursor till the right of the cursor |
|                   |                                                              |
|         u         | undo any changes made                                        |
|         p         | put the text that is in the buffer after cursor position     |
|         P         | put the text that is in the buffer before cursor position    |
|                   |                                                              |
|        xp         | trans(x)pose(p) swap two letters after and current cursor position |
|       [n]yy       | copy n lines to the buffer                                   |
|                   |                                                              |
|         .         | repeating last command                                       |
|         o         | Open blank line below the cursor                             |
|         O         | Open blank line above the cursor                             |
|                   |                                                              |
|     50 i* ESC     | inserts 50 asterisks                                         |
|     25 a*-ESC     | Appends 50 characters (25 pairs of asterisk and hyphen)      |
|                   |                                                              |
|       [n] J       | Joins the current and next n lines                           |
|                   |                                                              |
|       ^F ^B       | Move to the next or before screen i.e pages                  |
|                   |                                                              |
|      z ENTER      | Move current line to top of screen and scroll                |
|        z.         | Move current line to centre of screen and scroll.            |
|        z-         | Move current line to bottom of screen and scroll.            |
|                   |                                                              |
|     /pattern      | Search for pattern i.e "string" in file forward              |
|         n         | Repeat search in same direction                              |
|         N         | Repeat search in Opposite direction                          |
|                   |                                                              |
|       [n]G        | go to line no n                                              |
|        ``         | return to original position                                  |
|                   |                                                              |
|     vi + file     | Opens file at last line.                                     |
| vi +/pattern file | Opens file at line which has first occurrence pattern        |
|                   |                                                              |

-   vi also allows you to place yanks (copied text) into buffers identified by letters.
-   You can fill up to 26 (a–z) buffers with yanked text and restore that text with a put command at any time in your editing session.

|    "[n]"p     | recover last n deletions from the buffer           |
| :-----------: | -------------------------------------------------- |
|               | . will increment the n i.e buffer no.              |
| "\[%\]\[n\]yy | yank n lines into buffer named % -> [a-z]          |
| "\[%\]\[n\]p  | put  n lined from buffer named % after the cursor  |
| "\[%\]\[n\]P  | put  n lined from buffer named % before the cursor |

-   vim is an extension on "ex" editor which used to work on line by line.
-   Useful for editing , moving and copying in bulk
-   ex commands are used in vim by using :command
-   as each ex command requires line address which can be specified using
    1.  Explicit line number
    2.  Symbol which indicate relative position (+-)
    3.  search pattern as address

1.  Explicit Line Number

    |  :3,7d   | delete lines 3 through 7                     |
    | :------: | -------------------------------------------- |
    | :3,7m11  | move lines 3 through 7 to follow line 11     |
    | :3,7co11 | copy lines 3 through 7 and put after line 11 |

2.  |      Pattern       | Information                                                  |
    | :----------------: | ------------------------------------------------------------ |
    |        :%d         | delete all the lines from the file                           |
    |                    |                                                              |
    |    :/pattern/d     | Delete the next line containing pattern                      |
    |    :/pattern/+d    | Delete the line below containing the patter                  |
    |                    | Global Search                                                |
    |     :g/pattern     | Moves to the last Occurrence of the pattern                  |
    |    :g/pattern/p    | find and display all the lines with the pattern              |
    |   :g!/pattern/p    | finds and display all the lines without the pattern          |
    | :60,124g/pattern/p | Finds and displays any lines between lines 60 and 124 containing pattern. |
    |                    |                                                              |
    |                    |                                                              |

-   Multiple ex command are separated by |

    ```bash
    :/s/pattern/string | set nu | ... |
    ```

    

#### -- Editing between files
 As named buffer are not cleared when a new file is loaded into the vi buffer thus allowing copy , moving across various files

        "f4yy -> :w -> :e filename -> "fp

 Copies 4 lines from current file to filename using named buffer f



#### -- Global Replacement

 

|   :s/old/new/    | replace first occurrence on current line        |
| :--------------: | ----------------------------------------------- |
|   :s/old/new/g   | replace all   occurrence on current line        |
| :2,7s/old/new/g  | replace all occurrence between line 2 and 7     |
| :1,$s/old/new/g  | replace all occurrence from the file            |
|  :%s/old/new/g   | replace all occurrence from the file            |
| :1,$s/old/new/gc | confirm before replace occurrence from the file |
|                  |                                                 |


​          

#### -- Context Sensitive Replacement

-   Useful to first find lines matching a pattern and then operating on matched lines only
     Ex. find all those files whose size > 4096 replace user with user1

```
 :g/pattern/s/old/new/g 
```

-   first g tells that it should operate on entire file and then last g indicates that it should operate on all occurrence on each file.

-   Similarly d , mo , co can be used to instead

### Executing Linux Commands

-   You can display or read in the results of any Unix command while you are editing in
    vim . 
-   An exclamation mark ( ! ) tells ex to create a shell and to regard what follows as a
    Unix command:

```bash
:!command
```

-   In order to execute multiple commands run :!bash

#### You can combine :read with a call to Unix, to read the results of a Unix command into your file. 

```bash
:r !date
```

-   It will read in the system’s date information into the text of your file.
-    By preceding the :r command with a line address, you can read the result of the command in at any desired point in your file.
-   By default, it will appear after the current line.
-   The result of linux command is written into the file.

```
:r !linux_commands
```

```
:r ! ls | sort | grep Do
```

### Filtering Text Through a Command

-   Filtering text with ex

    ```bahs
    96,99!sort
    .,+2!sort
    .,$!sort
    ```

    

### Marking Places in VIM

-   Allows us to define certain point which can be referred with a case sensitive character.

-   Place markers are set only during the current vi session; they are not stored in the file.

-   |  mx  | Marks the current position with x (x can be any letter) case sensitive |
    | :--: | ------------------------------------------------------------ |
    |  'x  | (Apostrophe.) Moves the cursor to the first character of the line marked by x. |
    |  `x  | (Back-quote.) Moves the cursor to the character marked by x. |
    |  ``  | (Backquotes.) Returns to the exact position of the previous mark or context after a move. |
    |  ''  | (Apostrophes.) Returns to the beginning of the line of the previous mark or context. |

     

### Multiple Window Of Vim

-   To open multiple windows from the command line, use Vim’s -o option. For example:

    ```bash
    Vim -o file1 file2
    ```

| vim -o file1 file2  | Splits the window horizontally                               |
| :------------------ | :----------------------------------------------------------- |
| vim -O file1 file2  | Splits window vertically                                     |
| vim -o5 file1 file2 | Pre allocates 5 windows for editing                          |
| :split [filename]   | splits the current window **horizontally** into two half both showing same file if filename not provided |
| :vsplit [filename]  | splits the current window **vertically** into two half both showing same file if filename not provided |
|                     |                                                              |
| 3^Wx                | Swap the cursor with the 3rd window                          |
| ^Wx                 | Swap the cursor with the next window                         |
|                     |                                                              |
|                     |                                                              |

### Tabbed Editing

-   Vim lets you create new tabs, each of which behaves independently. In each tab
    you can split the screen, edit multiple files.

| :tabnew [ filename ] | Open a new tab and edit a file |
| :------------------: | ------------------------------ |
|      :tabclose       | closes current tab             |

