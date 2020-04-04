require_relative('../db/sql_runner')
require_relative('./team')

class Fixture

  attr_accessor :home_team_id, :away_team_id, :result
  attr_reader :id

  def initialize(options)
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @result = options['result']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO fixtures (
          home_team_id, away_team_id, result
          ) VALUES ($1, $2, $3) RETURNING *"
    values = [@home_team_id, @away_team_id, @result]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def Fixture.all()
    sql = "SELECT * FROM fixtures"
    result = SqlRunner.run(sql, [])
    return result.map {|fixture| Fixture.new(fixture)}
  end

  def update()
    sql = "UPDATE fixtures
           SET home_team_id = $1, away_team_id = $2, result = $3
           WHERE id = $4"
    values = [@home_team_id, @away_team_id, @result, @id]
    SqlRunner.run(sql, values)
  end

  def Fixture.delete_all()
    sql = "DELETE FROM fixtures"
    SqlRunner.run(sql, [])
  end

  def Fixture.delete(id)
    sql = "DELETE FROM fixtures WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def Fixture.teams(fixture)
    sql = "SELECT * FROM teams WHERE id = $1 or id = $2"
    values = [fixture.home_team_id, fixture.away_team_id]
    result = SqlRunner.run(sql, values)
    return result.map {|team| Team.new(team)}
  end

  def Fixture.home_team(fixture)
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [fixture.home_team_id]
    result = SqlRunner.run(sql, values).first
    return Team.new(result)
  end

  def Fixture.away_team(fixture)
    sql = "SELECT * FROM teams WHERE id = $1"
    values = [fixture.away_team_id]
    result = SqlRunner.run(sql, values).first
    return Team.new(result)
  end


  # Determines the winner of the match and updates the tables
  # if draw, put 'draw' as the parameter
  def result(winning_team_id)
    case
    when winning_team_id == @home_team_id
      @result = "HOME"
      update
    when winning_team_id == @away_team_id
      @result = "AWAY"
      update
    when winning_team_id == "draw"
      @result = "DRAW"
      update
    else return nil
    end
  end

end
