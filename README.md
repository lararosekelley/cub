#Cub, v0.1
_Make quick Wolfram|Alpha queries from the terminal_

###What is it?

A CLI for Wolfram|Alpha that allows you to ask anything and get an answer. Works on Unix-based operating systems (Mac OS, Linux). 

###How does it work?

Cub uses the Wolfram|Alpha API to make queries using curl, retrieve an XML document, and display a nicely formatted output using xmllint.

###Setup:

1. Download the zip from here, or simply clone the repository.
2. Extract the files and put them wherever you desire, then do this:

		$ nano ~/.bash_profile
		
3. From inside nano:

		alias cub="sudo sh /path/to/cub.sh"
4. Save the file and exit the terminal.
5. Now you can run the program by simply typing

		$ cub
6. But first, you need to get a Wolfram|Alpha ID. Go to [http://products.wolframalpha.com/api/](http://products.wolframalpha.com/api/), and get an AppID to get 2000 free queries per month.
7. Once you have your AppID, open up cub.sh and find this line near the top:

		id="" #your appid here
8. Enter your AppID, save the file, and you're all set!


###Screenshots

![one](img/one.png "one")

![two](img/two.png "two")

![three](img/three.png "three")

######&copy; 2014 Ty-Lucas Kelley





