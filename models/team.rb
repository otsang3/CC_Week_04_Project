require_relative('../db/sql_runner')
require_relative('./fixture')

class Team

  attr_accessor :name, :win, :draw, :loss, :points
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @win = options['win'].to_i
    @draw = options['draw'].to_i
    @loss = options['loss'].to_i
    @points = options['points'].to_i
  end

  def save()
    sql = "INSERT INTO teams (name, win, draw, loss, points)
           VALUES ($1, $2, $3, $4, $5) RETURNING *"
    values = [@name, @win, @draw, @loss, @points]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def Team.all()
    sql = "SELECT * FROM teams"
    result = SqlRunner.run(sql, [])
    return result.map {|team| Team.new(team)}
  end

  def update()
    sql = "UPDATE teams
           SET name = $1, win = $2, draw = $3, loss = $4, points = $5
           WHERE id = $6"
    values = [@name, @win, @draw, @loss, @points, @id]
    SqlRunner.run(sql, values)
  end

  def Team.delete_all()
    sql = "DELETE FROM teams"
    SqlRunner.run(sql, [])
  end

  def Team.delete(id)
    sql = "DELETE FROM teams WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def Team.find(id)
    sql ="SELECT * FROM teams WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return nil if result == nil
    return Team.new(result)
  end

  def Team.get_team_id(team)
    return if team == "draw"
    return team.id
  end

  def Team.win_match(team)
    team.win += 1
    team.points += 3
    team.update
  end

  def Team.draw_match(team)
    team.draw += 1
    team.points += 1
    team.update
  end

  def Team.lose_match(team)
    team.loss += 1
    team.update
  end

  # Method to return all fixtures for provided team
  def Team.fixtures(team)
    sql = "SELECT * FROM fixtures
           WHERE home_team_id = $1 or away_team_id = $1"
    values = [team.id]
    result = SqlRunner.run(sql, values)
    return result.map {|fixture| Fixture.new(fixture)}
  end

  # Method to return teams in an array by number of points
  def Team.sort_by_points()
    sql = "SELECT * FROM teams"
    result = SqlRunner.run(sql, [])
    result_map = result.map {|team| Team.new(team)}
    return result_map.sort_by {|team| -team.points}
  end

end
