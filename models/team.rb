require_relative('../db/sql_runner')

class Team

  attr_accessor :name, :win, :draw, :loss
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @win = 0
    @draw = 0
    @loss = 0
  end

  def save()
    sql = "INSERT INTO teams (name, win, draw, loss)
           VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@name, @win, @draw, @loss]
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
           SET name = $1, win = $2, draw = $3, loss = $4
           WHERE id = $5"
    values = [@name, @win, @draw, @loss, @id]
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

  def win_match()
    @win += 1
    update
  end

  def draw_match()
    @draw += 1
    update
  end

  def lose_match()
    @loss += 1
    update
  end

  def Team.fixtures(team)
    sql = "SELECT * FROM fixtures
           WHERE home_team_id = $1 or away_team_id = $1"
    values = [team.id]
    result = SqlRunner.run(sql, values)
    return result.map {|fixture| Fixture.new(fixture)}
  end

end
