require_relative('../db/sql_runner')
require_relative('./team')

class Fixture

  attr_accessor :home_team_id, :away_team_id, :result
  attr_reader :id

  def initialize(options)
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @result = options['result'].to_i if options['result']
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

  def Fixture.all_with_no_results()
    sql = "SELECT * FROM fixtures WHERE result IS NULL"
    result = SqlRunner.run(sql, [])
    return result.map {|fixture| Fixture.new(fixture)}
  end

  def Fixture.all_with_results()
    sql = "SELECT * FROM fixtures WHERE result IS NOT NULL"
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

  def Fixture.find(id)
    sql = "SELECT * FROM fixtures WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Fixture.new(result)
  end

  def Fixture.find_all_remaining_games(team_id)
    sql = "SELECT * FROM fixtures
           WHERE result IS NULL AND (home_team_id = $1 OR away_team_id = $1)"
    values = [team_id]
    result = SqlRunner.run(sql, values)
    return nil if result == nil
    return result.map {|fixture| Fixture.new(fixture)}
  end

  # Determines whether the winner of the fixture is the home or away team,
  # or 'draw' if neither team won
  def outcome()
    case
    when @result == @home_team_id
      p 'HOME WIN'
    when @result == @away_team_id
      p 'AWAY WIN'
    when @result == 'draw'
      p 'draw'
    else
      return nil
    end
  end


  # Determines the winner/loser of the match and updates the scores
  # and points in the teams/fixture table
  def match_result_win(winning_team, losing_team)
    winning_team_id = Team.get_team_id(winning_team)
    losing_team_id = Team.get_team_id(losing_team)
    case
    when winning_team_id == @home_team_id
      @result = @home_team_id
      update
      Team.win_match(winning_team)
      Team.lose_match(losing_team)
    when winning_team_id == @away_team_id
      @result = @away_team_id
      update
      Team.win_match(winning_team)
      Team.lose_match(losing_team)
    else return nil
    end
  end

  # Match result is a draw and updates the scores and
  # points in the teams/fixutre table
  def match_result_draw(home_team, away_team)
    home_team_id = Team.get_team_id(home_team)
    away_team_id = Team.get_team_id(away_team)
    @result = 0
    update
    Team.draw_match(home_team)
    Team.draw_match(away_team)
  end

  # method created for views/results/index.erb to show winning team or draw, of fixture
  def match_result_team(winning_team_id)
    case
    when winning_team_id == @home_team_id
      return "HOME WIN"
    when winning_team_id == @away_team_id
      return "AWAY WIN"
    when winning_team_id == 0
      return 'DRAW'
    else
      return nil
    end
  end

end
