require_relative('../db/sql_runner')
require_relative('./team')

class Fixture

  attr_accessor :home_team_id, :away_team_id, :result
  attr_reader :id

  def initialize(options)
    @home_team_id = options['home_team_id'].to_i if options['home_team_id']
    @away_team_id = options['away_team_id'].to_i if options['away_team_id']
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

  # Create a class method to search for all fixtures that have NO results
  def Fixture.all_with_no_results()
    # create the SQL query to return from the fixtures table where 'result' is null
    sql = "SELECT * FROM fixtures WHERE result IS NULL"
    # Assign the result from SqlRunner to a variable named 'result'
    result = SqlRunner.run(sql, [])
    # For each 'object' that is in the result tuple, create a new Fixture class
    # and then return the result as an array of the fixtures created
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

  def Fixture.find_all_played_games(team_id)
    sql = "SELECT * FROM fixtures
           WHERE result IS NOT NULL AND (home_team_id = $1 OR away_team_id = $1)"
    values = [team_id]
    result = SqlRunner.run(sql, values)
    return nil if result == nil
    return result.map {|fixture| Fixture.new(fixture)}
  end

  # Method created for controllers/results_controller
  # When a played fixture(result) is updated
  # create a method which removes stats created from the old result
  def remove_stats_from_fixture()
    home_team = Team.find(@home_team_id)
    away_team = Team.find(@away_team_id)
    case
    when @result == home_team.id
      home_team.win -= 1
      home_team.points -= 3
      away_team.loss -= 1
      home_team.games_played -= 1
      away_team.games_played -= 1
    when @result == away_team.id
      away_team.win -= 1
      away_team.points -= 3
      home_team.loss -=1
      home_team.games_played -= 1
      away_team.games_played -= 1
    when @result == 0
      home_team.draw -= 1
      home_team.points -=1
      away_team.draw -= 1
      away_team.points -=1
      home_team.games_played -= 1
      away_team.games_played -= 1
    else return nil
    end
    home_team.update
    away_team.update
  end

  # Second part of the remove_stats_from_fixture method
  # Method created for controllers/results_controller
  # When a played fixture(result) is updated
  # create a method which updates stats from the revised fixture
  def add_stats_from_fixture()
    home_team = Team.find(@home_team_id)
    away_team = Team.find(@away_team_id)
    case
    when @result == home_team.id
      home_team.win += 1
      home_team.points += 3
      away_team.loss += 1
      home_team.games_played += 1
      away_team.games_played += 1
    when @result == away_team.id
      away_team.win += 1
      away_team.points += 3
      home_team.loss +=1
      home_team.games_played += 1
      away_team.games_played += 1
    when @result == 0
      home_team.draw += 1
      home_team.points +=1
      away_team.draw += 1
      away_team.points +=1
      home_team.games_played += 1
      away_team.games_played += 1
    else return nil
    end
    home_team.update
    away_team.update
  end

  # Method created for controllers/results_controller to display the
  # result of a fixture from the selected team's perspective
  def result_indicator(id)
    case
    when @result == id
      p "WON"
    when @result == 0
      p "DRAW"
    else
      p "LOST"
    end
  end

  # Determines whether the winner of the fixture is the home or away team,
  # or 'draw' if neither team won
  # created for views/results/index.erb
  def outcome()
    case
    when @result == @home_team_id
      home_team = Team.find(@home_team_id)
      p "#{home_team.name} WIN"
    when @result == @away_team_id
      away_team = Team.find(@away_team_id)
      p "#{away_team.name} WIN"
    when @result == 0
      p 'DRAW'
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
