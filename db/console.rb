require('pry-byebug')
require_relative('../models/team.rb')
require_relative('../models/fixture.rb')

team_liv = Team.new({'name' => 'Liverpool'})
team_liv.save()

team_mci = Team.new({'name' => 'Manchester City'})
team_mci.save()

fixture1 = Fixture.new({'home_team_id' => team_liv.id,
                        'away_team_id' => team_mci.id})







binding.pry
nil
