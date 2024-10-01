#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Vérifiez si l'utilisateur existe déjà
USER_INFO=$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_INFO ]]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    # Insérez l'utilisateur dans la base de données
    INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
else
    GAMES_PLAYED=$(echo $USER_INFO | cut -d '|' -f 1)
    BEST_GAME=$(echo $USER_INFO | cut -d '|' -f 2)
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Générer un nombre aléatoire
SECRET_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
    read GUESS

    # Vérifiez si l'entrée est un entier
    if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    fi

    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

    if [[ $GUESS -lt $SECRET_NUMBER ]]; then
        echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
        echo "It's lower than that, guess again:"
    else
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        break
    fi
done

# Mettre à jour les statistiques de l'utilisateur
if [[ -z $BEST_GAME ]] || [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
    BEST_GAME=$NUMBER_OF_GUESSES
fi

UPDATE_USER=$($PSQL "UPDATE users SET games_played = games_played + 1, best_game = $BEST_GAME WHERE username = '$USERNAME'")
