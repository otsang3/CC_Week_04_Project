require('pry-byebug')
require_relative('../models/team.rb')
require_relative('../models/fixture.rb')

team_liv = Team.new({'name' => 'Liverpool'})
team_liv.save()

team_mci = Team.new({'name' => 'Manchester City'})
team_mci.save()

team_che = Team.new({'name' => 'Chelsea'})
team_che.save()

fixture1 = Fixture.new({'home_team_id' => team_liv.id,
                        'away_team_id' => team_mci.id})

fixture2 = Fixture.new({'home_team_id' => team_liv.id,
                        'away_team_id' => team_che.id})

fixture3 = Fixture.new({'home_team_id' => team_mci.id,
                        'away_team_id' => team_liv.id})

fixture1.save()
fixture2.save()
fixture3.save()

binding.pry
nil
