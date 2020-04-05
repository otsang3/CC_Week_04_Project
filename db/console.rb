require('pry-byebug')
require_relative('../models/team.rb')
require_relative('../models/fixture.rb')
require_relative('../models/player.rb')

team_liv = Team.new({'name' => 'Liverpool'})
team_mci = Team.new({'name' => 'Manchester City'})
team_che = Team.new({'name' => 'Chelsea'})
team_man = Team.new({'name' => 'Manchester United'})
team_ars = Team.new({'name' => 'Arsenal'})
team_spu = Team.new({'name' => 'Tottenham Spurs'})
team_lei = Team.new({'name' => 'Leicester City'})
team_wol = Team.new({'name' => 'Wolves'})

team_liv.save()
team_mci.save()
team_che.save()
team_man.save()
team_ars.save()
team_spu.save()
team_lei.save()
team_wol.save()

fixture1 = Fixture.new({'home_team_id' => team_liv.id,
                        'away_team_id' => team_mci.id})
fixture2 = Fixture.new({'home_team_id' => team_man.id,
                        'away_team_id' => team_mci.id})
fixture3 = Fixture.new({'home_team_id' => team_ars.id,
                        'away_team_id' => team_spu.id})
fixture4 = Fixture.new({'home_team_id' => team_ars.id,
                        'away_team_id' => team_wol.id})
fixture5 = Fixture.new({'home_team_id' => team_spu.id,
                        'away_team_id' => team_liv.id})
fixture6 = Fixture.new({'home_team_id' => team_mci.id,
                        'away_team_id' => team_liv.id})
fixture7 = Fixture.new({'home_team_id' => team_wol.id,
                        'away_team_id' => team_che.id})
fixture8 = Fixture.new({'home_team_id' => team_che.id,
                        'away_team_id' => team_ars.id})
fixture9 = Fixture.new({'home_team_id' => team_spu.id,
                        'away_team_id' => team_man.id})
fixture10 = Fixture.new({'home_team_id' => team_man.id,
                         'away_team_id' => team_wol.id})
fixture1.save()
fixture2.save()
fixture3.save()
fixture4.save()
fixture5.save()
fixture6.save()
fixture7.save()
fixture8.save()
fixture9.save()
fixture10.save()
fixture1.match_result_win(team_liv, team_mci)
fixture2.match_result_win(team_man, team_mci)
fixture3.match_result_win(team_spu, team_ars)
fixture4.match_result_draw(team_ars, team_wol)
fixture5.match_result_draw(team_spu, team_liv)

player1 = Player.new({'first_name' => 'Sadio',
                      'last_name' => 'Mane',
                      'team_id' => team_liv.id
                      })
player2 = Player.new({'first_name' => 'Sergio',
                      'last_name' => 'Aguero',
                      'team_id' => team_mci.id
                      })

player1.save()
player2.save()

binding.pry
nil
