require_relative('../db/sql_runner')

class Team

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
    @win = 0
    @draw = 0
    @loss = 0
  end

  def save()
    sql = "INSERT INTO teams (name)
           VALUES ($1) RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def Team.all()
    sql = "SELECT * FROM teams"
    result = SqlRunner.run(sql, [])
    return result.map {|team| Team.new(team)}
  end

end
