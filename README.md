Using the command line
======================

This tutorial is intended to give you a brief overview of using the terminal to make folders, manipulate files, and create simple shell scripts.

Get your working directory
---------------------

First you'll want to figure out what directory (folder) you are currently in. This is called your "working directory". To get it simple type

```
$ pwd
```
 and hit "enter". This will **p**rint the **w**orking **d**irectory. You should see something like

 ```
 /Users/janedoe
 ```
Making a new directory
---------------------

Now we want to setup a new directory for our project. You can call it whatever you want. I will call mine **linux_tutorial**

Note: It's a good idea to avoid spaces when naming directories and files, use a dash or underscore instead

```
$ mkdir linux_tutorial
```

Listing files and directories
---------------------
To view all the files and directories in your current working directory enter

```
$ ls
# Adding the -l flag will give you more information about the files
$ ls -l
```

Moving between directories
---------------------
To navigate into and out of directories use the command cd, short for "change directory"

To move up one level (from your project directory to your home directory) enter

```
$ cd ..
```
Now list the files to see your project directory

To move into the project directory type
```
$ cd linux_tutorial
```

Practice moving around in the different directories in your computer. To move through more than one level at a time, connect the directories with /. Using the tab key will autocomplete the name of available files and directories once you type the first few letters.

```
$ cd ./chou_lab/project1/papers
```
Go ahead and make two subdirectories in your project directory called "tmp" and "code"

Now rename your "tmp" directory to something else using the move command
```
$ mv tmp pointless
```

Now delete it
```
$ rm -r pointless
```
The -r flag means "recursive" which will remove an entire directory

Moving files
---------------------
Now let's move the files you downloaded to your desktop to your project folder

```
cp ~/Desktop/data/ .
```

The ~ symbol is a shortcut to your home directory and the . represents your current working directory. Check that the data is in your directory.

Finding Files
-------------

Let's say you want to find all the read one files in this directory. We can search our files by name and look for only the ones ending in "R1". In linux the * symbol is a wild card meaning any length of any characters.

```
$ find -name "*.fastq"
```

Looking at Files
-----------------

```
$ head SRR8054126_R1.fastq
```
To view more lines you can add the -n flag with the number of lines you wish to view
```
$ head -n 20 SRR8054126_R1.fastq
```
To scroll through the whole file use more
```
$ more SRR8054126_R1.fastq
```
You can view more lines by hitting Enter and you can exit by hitting "q"

Finding words within a file
---------------------------
Now let's find a specific read in our file. We can use the grep command.  Let's just look for the first header in our file.

```
$ grep "@SRR8054126.1 D0062" SRR8054126_R1.fastq
```
Now let's count how many times that pattern appears
```
$ grep -c "@SRR8054126.1 D0062" SRR8054126_R1.fastq
```
Try using this to count how many reads are in the fastq file

Writing a bash script
---------------------
Now let's say I want to count the number of reads in my
