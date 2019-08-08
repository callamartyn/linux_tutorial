Using the command line
======================

This tutorial is intended to give you a brief overview of using the terminal to make folders, manipulate files, and create simple shell scripts.

Get your working directory
---------------------

First you'll want to figure out what directory (folder) you are currently in. This is called your "working directory". To get it simple type

```bash
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

Useful bash things
==================
Use the arrow key at the prompt to get to previous commands.

Tab will attempt to autocomplete what you are typing (if you here a noise instead it means there is nothing there with that filename).

ctrl+a will take you to the beginning of the prompt line

ctrl+e will take you to the end of the prompt line

type "history" to get to view your previous commands

Writing shell scripts
=====================
It can be helpful to string commands together in a shell script. Let's start by writing a "Hello World" script. If you are writing a longer script you should probably use a text editor like atom. But ours will be short so we will use nano, some people prefer vim.

Hello world script
------------------
To create a new file type
```
nano hello_world.sh
```
The sh means it's a shell script. You should now see a blank window. You won't be able to click around here, only navigate with the arrow keys. There are some helpful commands printed at the bottom of the window.

Start by typing
```
#!/bin/bash
```
at the top of the page. This tells the computer it is reading a bash script. Any line with a # sign will not be read as a command, it will be commented out. It is a good idea to add comments to your code as you write it. Then on the next line type

```bash
echo "Hello world"
```

Now hit ctrl+x to exit and Y to save. Now we need to make the script executable so type
```
$ chmod +x hello_world.sh
```
Testing is as simple as typing the name of the script with the directory prefix
```
$ ./hello_world.sh
```
Looping over files
------------------
Now let's say I want to count the number of reads in each of my files. To do this I will use a for loop. A for loop will take a list and run some operation on each item in the list. In this case we want a list of all of our files. First see if you can write a script that just finds all the fastq files.

Next we want to save the files as a list in our script. We can do this by assigning it to a variable. For example

```bash
files=$(find . -name "*.fastq")
```
Bash variables start with the $ sign. So every time you use this variable you should now type it as $files

```bash
echo $files
```
Now let's loop through our list. Bash loops have the following format
```bash
for item in $list
  do
  # operation to be performed on each item
  done
```
With that in mind, and knowing how to cound the number of reads in a file, try to get your loop to print out the number of reads in each file.

**Hint** Try testing each new addition before adding more. Make sure your loop is working by having it print out each item, etc.

If you get that working, try changing it by adding some text so it prints out
```
Sample SRR8054126_R1 has 12846 reads
```
you will need echo and basename to do this

Challenge
---------
Bored? Look up how to use if statements in bash. Try to only print the files with greater than a certain number of reads.
