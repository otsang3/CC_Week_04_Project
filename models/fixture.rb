require_relative('../db/sql_runner')

class Fixture

  def initialize(options)
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @id = options['id'].to_i
  end

end
