#!/bin/bash
#
#Guessing Game
#guessingGame.sh
#
#Guess game to determine a number between 1 - 100
#If Number is found, echo. If user inputs 5 times, will give hint
#If User inputs 10 times, will reset and give answer
#
#Created: Oct 27 2020 Author: Rui Qi Huang


typeset -i count=0
#read user input
echo -e "Guess a number between 1 and 100. You have 10 tries.\n"
read guess
#generate random number
(( number = RANDOM % 100 + 1 ))
#determine if number is even or odd to be used later
if [ $((number%2)) -eq 0 ];
then	
	i="even";
else
	i="odd";
fi

#while loop to check if guess equals to number
while [ $guess != $number ]
do
	#counting user inputs
	count=count+1
	#echo odd/even after 5 inuts
	if [[ $count == 5 ]]
	then	
		echo "HINT: The number is $i"
	fi
	#echo and generate new number and reset count
	if [[ $count == 10 ]]
	then 	
		echo
		echo "Sorry! You used up all 10 tries, the number was $number"
		echo "A new number has been picked!"
		echo "control+Z to exit!"
	count=0
	(( number = RANDOM % 100 + 1 ))

	fi
	#code to determine if even or odd
	if [[ $guess -gt $number ]]
	then 
		echo -e "\nYour Number is TOO HIGH!"
	else
		echo -e "\nYour Number is TOO LOW!"
	fi
	echo
	##read guess again
	echo "Please Guess Again: "
	read guess

done
echo -e "WOW, your smart! CORRECT"	
