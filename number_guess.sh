#!/bin/bash

# Command to interact with PostgreSQL
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompt for username
echo "Enter your username:"
read USERNAME

# Check username length
if [[ ${#USERNAME} -gt 22 ]]; then
  echo "Username must be 22 characters or less."
  exit 1
fi

# Check if the user already exists in the database
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

# If the user is new
if [[ -z $USER_INFO ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert the new user into the database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0)")
else
  # Existing user: extract information
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"

  # Check if BEST_GAME is NULL or empty
  if [[ -z $BEST_GAME ]]; then
    BEST_GAME="N/A"
  fi

  # Display the welcome back message
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start the guessing game
echo "Guess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0

while true; do
  read GUESS

  # Check if the input is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Increment the guess count
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  # Check the guess against the secret number
  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    # Message when the number is guessed correctly
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update games played and best game if applicable
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")

    # Update best game if the current game is better
    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
    fi

    # End the game
    break
  fi
done

#git commit -m "feat: add user check and greeting"
#git commit -m "fix: correct guess logic"
#git commit -m "chore: cleanup and comments"
#git commit --amend -m "New commit message"