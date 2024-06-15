#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Trucating the tables and restarting the identity will make the ID starts with 1 everytime I test my code
echo $($PSQL "TRUNCATE games, teams RESTART IDENTITY")

cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" && $ROUND != "Round" && $WINNER != "Winner" && $OPPONENT != "Opponent" && $WINNER_GOALS != "winner_goals" && $OPPONENT_GOALS != "opponent_goals" ]]
  then
    # teams table
    # Create an array with team names
    teams=("$WINNER" "$OPPONENT")

    # Loop through the array and insert each team name
    for team in "${teams[@]}"; do
      #get team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$team'")

      # If not exist
      if [[ -z $TEAM_ID ]]
      then
        # Insert name
        INSERT_NAME=$($PSQL "INSERT INTO teams(name) VALUES ('$team')")
        
        # Check if the insertion was successful
        if [[ $INSERT_NAME == "INSERT 0 1" ]]
        then
          echo "Inserted into teams: $team"
        fi
      fi
    done
    
    # games table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    # insert game
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    
    if [[ $INSERT_GAME == "INSERT 0 1" ]]
    then
      echo "Inserted into games: $YEAR, $ROUND, $WINNER vs $OPPONENT"
    fi
  fi
done