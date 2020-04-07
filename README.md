# CC_Week_04_Project

**PROJECT TITLE**
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

**PREREQUISITES**
Install PG
Install Ruby
Install Sinatra

**INSTALLING**
Create a database called 'league'. *(If the user decides to use a different name
for the database, then the database name should be amended in db/sql_runner
[dbname:])*
`createdb league`

*(Optional)* Run db/console.rb if user wishes to use preset data for the app.
`psql -d league -f db/console.rb`

Run app.rb to start the localhost.
`ruby app.rb`

**USING THE APP**
