require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/team')
require_relative('../models/fixture')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class TeamTest < MiniTest::Test

  def setup()
    @team_liv = Team.new('name' => 'Liverpool')
    @team_mci = Team.new({'name' => 'Manchester City'})
    @fixture1 = Fixture.new({'home_team_id' => @team_liv.id,
                            'away_team_id' => @team_mci.id})
  end

  def test_win_match()
    @team_liv.win_match
    assert_equal(1, @team_liv.win)
  end

  def test_draw_match()
    @team_liv.draw_match
    assert_equal(1, @team_liv.draw)
  end

  def test_lose_match()
    @team_liv.lose_match
    assert_equal(1, @team_liv.loss)
  end

end
