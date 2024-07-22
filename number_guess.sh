#!/bin/bash

random_number=$((1 + RANDOM % 1000))
echo $random_number

echo "Enter your username:"
read user_name

psql_user_name_exists=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "SELECT EXISTS (SELECT FROM user_data WHERE user_name = '$user_name');")

if [[ $psql_user_name_exists = "f" ]]; then
  echo "Welcome, $user_name! It looks like this is your first time here."
  psql_insert_user_name=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "INSERT INTO user_data (user_name) VALUES ('$user_name');")
  games_played=1
else
  games_played=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "SELECT games_played FROM user_data WHERE user_name = '$user_name';")
  best_game_guesses=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "SELECT number_of_user_guesses FROM user_data WHERE user_name = '$user_name';")
  echo "Welcome back, $user_name! You have played $games_played games, and your best game took $best_game_guesses guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read user_guess
number_of_user_guesses=0

while [[ ! $user_guess =~ ^[0-9]+$ ]]; do
    echo "That is not an integer, guess again:"
    read user_guess
    (($number_of_user_guesses++))
done

while [ $user_guess -ne $random_number ]; do

  if [ $user_guess -gt $random_number ]; then
    echo "It's lower than that, guess again:"
    read user_guess
    ((number_of_user_guesses++))
    continue
  fi

  if [ $user_guess -lt $random_number ]; then
    echo "It's higher than that, guess again:"
    read user_guess
    ((number_of_user_guesses++))
    continue
  fi
done 

((number_of_user_guesses++))
echo "You guessed it in $number_of_user_guesses tries. The secret number was $random_number. Nice job!"

psql_insert_number_of_user_guesses=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "UPDATE user_data SET number_of_user_guesses = $number_of_user_guesses WHERE user_name = '$user_name';")
psql_insert_games_played=$(psql --username=freecodecamp --dbname=number_guess -t --no-align -c "UPDATE user_data SET games_played = $games_played WHERE user_name = '$user_name';")

#cat
#cat
#cat
#cat
#cat