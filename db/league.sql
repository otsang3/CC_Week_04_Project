DROP TABLE IF EXISTS fixtures;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS teams;


CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  win INT,
  draw INT,
  loss INT,
  games_played INT,
  points INT
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  team_id INT REFERENCES teams(id) ON DELETE CASCADE,
  goals INT,
  assists INT,
  yellow_cards INT,
  red_cards INT
);

CREATE TABLE fixtures (
  id SERIAL PRIMARY KEY,
  home_team_id INT REFERENCES teams(id) ON DELETE CASCADE,
  away_team_id INT REFERENCES teams(id) ON DELETE CASCADE,
  result VARCHAR(255)
);
