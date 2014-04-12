#cub.sh - quick wolfram|alpha queries from the terminal

#api info
url="http://api.wolframalpha.com/v2/query"
id="" #your appid here

#prompt
stop=0
cols=$(tput cols)
title="cub.sh: mini wolfram|alpha client"
printf "%*s\n\n" $(((${#title}+$cols)/2)) "$title"

while [ $stop -eq 0 ]; do
	#get input
	printf "enter what you want to calculate or know about: "
	read input
	query="$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "$input")"
	printf "computing...\n"
	
	#get result
	curl -s -L -G -d "input=$query&appid=$id&format=plaintext" $url > result.xml
	result=$(xmllint --xpath '/' result.xml)
	
	#format and display result
	if  [[ $result == *success=\"false\"* ]]; then
		printf "\n\noops! something went wrong...\n\n"
	else	
		num_pods=$(xmllint --xpath "string(/queryresult/@numpods)" result.xml)
		for (( i=1; i<=$num_pods; i++ ))
		do
			title=$(xmllint --xpath "string(//pod[$i]/@title)" result.xml)
			info=$(xmllint --xpath "string(//pod[$i]/subpod/plaintext)" result.xml)
			
			if [[ "$info" == "" ]]; then
				glock="rf"
			else
				printf "\n\e[1m\e[4m$title\n" | tr '[:upper:]' '[:lower:]'
				printf "\n\n\e[0m$info\n\n"
			fi
		done	
	fi
	
	#delete temporary file
	rm result.xml
	
	#ask for another query
	printf "\ndo you have any more questions (y/n)? "
	read yes_no
	if [ "$yes_no" == "y" ]; then
		stop=0
	else
		stop=1
	fi
	
	printf " \n"
done