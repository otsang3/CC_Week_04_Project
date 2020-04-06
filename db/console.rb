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
fixture2 = Fixture.new({'home_team_id' => team_liv.id,
                        'away_team_id' => team_ars.id})
fixture3 = Fixture.new({'home_team_id' => team_liv.id,
                        'away_team_id' => team_che.id})
fixture4 = Fixture.new({'home_team_id' => team_liv.id,
                        'away_team_id' => team_wol.id})
fixture5 = Fixture.new({'home_team_id' => team_liv.id,
                        'away_team_id' => team_man.id})
fixture6 = Fixture.new({'home_team_id' => team_mci.id,
                        'away_team_id' => team_spu.id})
fixture7 = Fixture.new({'home_team_id' => team_mci.id,
                        'away_team_id' => team_che.id})
fixture8 = Fixture.new({'home_team_id' => team_mci.id,
                        'away_team_id' => team_ars.id})
fixture9 = Fixture.new({'home_team_id' => team_mci.id,
                        'away_team_id' => team_lei.id})
fixture10 = Fixture.new({'home_team_id' => team_mci.id,
                        'away_team_id' => team_wol.id})
fixture11 = Fixture.new({'home_team_id' => team_che.id,
                        'away_team_id' => team_ars.id})
fixture12 = Fixture.new({'home_team_id' => team_che.id,
                        'away_team_id' => team_liv.id})
fixture13 = Fixture.new({'home_team_id' => team_che.id,
                        'away_team_id' => team_wol.id})
fixture14 = Fixture.new({'home_team_id' => team_che.id,
                        'away_team_id' => team_spu.id})
fixture15 = Fixture.new({'home_team_id' => team_che.id,
                        'away_team_id' => team_man.id})
fixture16 = Fixture.new({'home_team_id' => team_man.id,
                        'away_team_id' => team_mci.id})
fixture17 = Fixture.new({'home_team_id' => team_man.id,
                         'away_team_id' => team_wol.id})
fixture18 = Fixture.new({'home_team_id' => team_man.id,
                       'away_team_id' => team_lei.id})
fixture19 = Fixture.new({'home_team_id' => team_man.id,
                         'away_team_id' => team_ars.id})
fixture20 = Fixture.new({'home_team_id' => team_man.id,
                         'away_team_id' => team_liv.id})
fixture21 = Fixture.new({'home_team_id' => team_man.id,
                         'away_team_id' => team_spu.id})
fixture22 = Fixture.new({'home_team_id' => team_ars.id,
                        'away_team_id' => team_spu.id})
fixture23 = Fixture.new({'home_team_id' => team_ars.id,
                        'away_team_id' => team_wol.id})
fixture24 = Fixture.new({'home_team_id' => team_ars.id,
                        'away_team_id' => team_liv.id})
fixture25 = Fixture.new({'home_team_id' => team_ars.id,
                        'away_team_id' => team_lei.id})
fixture26 = Fixture.new({'home_team_id' => team_ars.id,
                        'away_team_id' => team_che.id})
fixture27 = Fixture.new({'home_team_id' => team_spu.id,
                        'away_team_id' => team_liv.id})
fixture28 = Fixture.new({'home_team_id' => team_spu.id,
                        'away_team_id' => team_man.id})
fixture29 = Fixture.new({'home_team_id' => team_spu.id,
                        'away_team_id' => team_lei.id})
fixture30 = Fixture.new({'home_team_id' => team_spu.id,
                        'away_team_id' => team_wol.id})
fixture31 = Fixture.new({'home_team_id' => team_spu.id,
                        'away_team_id' => team_mci.id})
fixture32 = Fixture.new({'home_team_id' => team_spu.id,
                        'away_team_id' => team_ars.id})
fixture33 = Fixture.new({'home_team_id' => team_wol.id,
                        'away_team_id' => team_che.id})
fixture34 = Fixture.new({'home_team_id' => team_wol.id,
                         'away_team_id' => team_mci.id})
fixture41 = Fixture.new({'home_team_id' => team_wol.id,
                         'away_team_id' => team_man.id})
fixture35 = Fixture.new({'home_team_id' => team_lei.id,
                         'away_team_id' => team_mci.id})
fixture36 = Fixture.new({'home_team_id' => team_lei.id,
                         'away_team_id' => team_liv.id})
fixture37 = Fixture.new({'home_team_id' => team_lei.id,
                         'away_team_id' => team_man.id})
fixture38 = Fixture.new({'home_team_id' => team_lei.id,
                         'away_team_id' => team_ars.id})
fixture39 = Fixture.new({'home_team_id' => team_lei.id,
                         'away_team_id' => team_ars.id})
fixture40 = Fixture.new({'home_team_id' => team_lei.id,
                         'away_team_id' => team_che.id})



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
fixture11.save()
fixture12.save()
fixture13.save()
fixture14.save()
fixture15.save()
fixture16.save()
fixture17.save()
fixture18.save()
fixture19.save()
fixture20.save()
fixture21.save()
fixture22.save()
fixture23.save()
fixture24.save()
fixture25.save()
fixture26.save()
fixture27.save()
fixture28.save()
fixture29.save()
fixture30.save()
fixture31.save()
fixture32.save()
fixture33.save()
fixture34.save()
fixture35.save()
fixture36.save()
fixture37.save()
fixture38.save()
fixture39.save()
fixture40.save()

fixture1.match_result_win(team_liv, team_mci)
fixture2.match_result_win(team_liv, team_ars)
fixture3.match_result_win(team_liv, team_che)
fixture6.match_result_win(team_mci, team_spu)
fixture7.match_result_win(team_mci, team_che)
fixture8.match_result_win(team_mci, team_ars)
fixture11.match_result_win(team_che, team_ars)
fixture12.match_result_win(team_liv, team_che)
fixture13.match_result_win(team_che, team_wol)
fixture16.match_result_draw(team_man, team_mci)
fixture17.match_result_win(team_man, team_wol)
fixture18.match_result_win(team_man, team_lei)
fixture22.match_result_draw(team_ars, team_spu)
fixture23.match_result_draw(team_ars, team_wol)
fixture24.match_result_win(team_liv, team_ars)
fixture27.match_result_win(team_liv, team_spu)
fixture28.match_result_draw(team_spu, team_man)
fixture29.match_result_win(team_spu, team_lei)
fixture33.match_result_draw(team_wol, team_che)
fixture34.match_result_win(team_mci, team_wol)
fixture35.match_result_win(team_mci, team_lei)
fixture36.match_result_win(team_liv, team_lei)
fixture37.match_result_draw(team_lei, team_man)
fixture38.match_result_win(team_lei, team_ars)
fixture41.match_result_win(team_man, team_wol)

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
