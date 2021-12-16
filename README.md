# PoplParserProject

## Group Name:

### SPUDs

## Group Members:

* Austin Corteville

* Keaton Meyer

* Bailey Richards

* Jacob Salka

## How to run it:

* Make sure you are on a unix based system. This can either be through WSL in windows, MacOS, or Linux.

* run "sudo apt install default-jdk" in terminal

* run the following commands: 
$ cd /usr/local/lib
$ wget https://www.antlr.org/download/antlr-4.9.2-complete.jar
$ export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:$CLASSPATH"
$ alias antlr4='java -jar /usr/local/lib/antlr-4.9.2-complete.jar'
$ alias grun='java org.antlr.v4.gui.TestRig'

* Run the following commands:
$ antlr4 Python_test.g4
$ javac Python_test*.java
$ grun Python_test fileInput python_test_code.py
    - optionally you can add -tokens, -tree, or -gui to the end
    
* !! Note !! Make sure to have the test file in the directory you're running the code in. The file is hardlinked into the code

## Video:

https://user-images.githubusercontent.com/55512495/146307137-3d1b8fb0-43f3-4236-8808-8e710325870f.mp4

