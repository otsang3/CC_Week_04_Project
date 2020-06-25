# Sports League app

## PROJECT TITLE

An app that allows users to create their own football league.
The user will be able to create new teams to add to the league.
The user will be able to edit and remove existing teams to the league.
A team has the following attributes: name, wins, draws, loss, games_played and
points which can be updated.
The user will be able to create matches with existing teams.
The user will be able to edit and delete matches.
The user will be able to create results from matches. When results are
created, the app will update the team stats according to the result of the
match.

## PREREQUISITES

Install PG \
Install Ruby \
Install Sinatra

## INSTALLING

Create a database called 'league'. *(If the user decides to use a different name
for the database, then the database name should be amended in db/sql_runner
[dbname:])*

`createdb league`

*(Optional)* Run db/console.rb if user wishes to use preset data for the app.
`psql -d league -f db/console.rb`

Run app.rb to start the localhost.

`ruby app.rb`

## USING THE APP

### HOMEPAGE

Displays the homepage of the app

### LEAGUE TABLE

Displays the table of all teams sorted by points

### TEAMS

#### *ALL TEAMS*
Displays all teams

#### *CREATE A NEW TEAM*
Allows the user to create a new team with choice of team name

#### *EDIT TEAMS*
Allows the user to edit name of an existing team or delete a team

### FIXTURES

#### *ALL FIXTURES*
Displays all fixtures

#### *FIND FIXTURE BY TEAM*
Allows the user to select an existing team. Displays all fixtures which includes
the selected team

#### *CREATE NEW FIXTURE*
Allows the user to create a new fixture with existing teams

#### *EDIT FIXTURES*
Allows the user to edit a fixture and amend the teams for that fixture

### RESULTS

#### *ALL RESULTS*
Displays all results (fixtures that have a result ie. home_win, away_win, draw)

#### *FIND RESULTS BY TEAM*
Allows the user to select an existing team. Displays all results which includes
the selected team

#### *CREATE NEW RESULT*
Allows the user to create a new result with existing fixtures

#### *EDIT RESULTS*
Allows the user to edit a result and change the outcome

## FUTURE PROJECT

### PLAYERS

Add functionality in the app to create players and assign players to teams. \
Players should have stats such as: goals, assists, no. of yellow cards,
no. of red cards.

### TEAMS

Add functionality to display all players for each team (dependent on PLAYERS
function)

### LEAGUE TABLE

Add columns in the table for: goals for, goals against, goal difference

### STATS

Create a new directory to display cool stats such as: top goalscorer,
most assists, most red cards, most yellow cards.

### RESULTS

Add functionality to input goals scored, assists, yellow/red cards awarded in
each result. Ensure that these stats are also updated to the LEAGUE TABLE and
STATS.
