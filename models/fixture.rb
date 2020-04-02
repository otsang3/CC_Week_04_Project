require_relative('../db/sql_runner')

class Fixture

  attr_accessor :home_team_id, :away_team_id
  attr_reader :id

  def initialize(options)
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO fixtures (
          home_team_id, away_team_id
          ) VALUES ($1, $2) RETURNING *"
    values = [@home_team_id, @away_team_id]
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
           SET home_team_id = $1, away_team_id = $2
           WHERE id = $3"
    values = [@home_team_id, @away_team_id, @id]
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

end
