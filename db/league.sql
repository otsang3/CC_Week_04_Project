DROP TABLE IF EXISTS teams;

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  win INT,
  draw INT,
  lose INT
);