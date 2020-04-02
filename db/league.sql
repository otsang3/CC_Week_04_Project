DROP TABLE IF EXISTS fixtures;
DROP TABLE IF EXISTS teams;

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  win INT,
  draw INT,
  loss INT
);

CREATE TABLE fixtures (
  id SERIAL PRIMARY KEY,
  home_team_id INT REFERENCES teams(id) ON DELETE CASCADE,
  away_team_id INT REFERENCES teams(id) ON DELETE CASCADE,
  result VARCHAR(255)
);
