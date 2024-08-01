#!/bin/bash
#Alice Lima Soares
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Get user input
echo "Enter your username:"
read USERNAME

# Get user_id from the database
USER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")

# Check if the user_id is found in the database
if [[ -z $USER_ID ]]; then
  # Add new user to the database
  INSERT_USER=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME');")
  
  # Retrieve the new user's ID
  USER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")

  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  # Retrieve number of games played and best game
  GAMES_PLAYED=$($PSQL "SELECT COUNT(player_id) FROM games WHERE player_id=$USER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE player_id=$USER_ID;")
  
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Guess_number function
GUESS_NUMBER() {
  # Secret number
  SECRET_NUMBER=$((1 + $RANDOM % 1000))

  # Number of guesses
  TRIES=0

  # Get user input
  echo -e "\nGuess the secret number between 1 and 1000:"

  while true; do
    read USER_GUESS

    # Validate input as a number
    while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]; do
      echo -e "\nThat is not an integer, guess again:"
      read USER_GUESS
    done

    # Increment guess count
    TRIES=$((TRIES + 1))

    # Check if the guess is correct
    if [[ $SECRET_NUMBER -gt $USER_GUESS ]]; then
      echo -e "\nIt's higher than that, guess again:"
    elif [[ $SECRET_NUMBER -lt $USER_GUESS ]]; then
      echo -e "\nIt's lower than that, guess again:"
    else
      echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
      
      # Insert game result into the database
      INSERT_GAME=$($PSQL "INSERT INTO games(player_id, number_of_guesses, secret_number) VALUES($USER_ID, $TRIES, $SECRET_NUMBER);")
      break
    fi
  done
}

# Starting the game
GUESS_NUMBER
