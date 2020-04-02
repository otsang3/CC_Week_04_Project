require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/team')


class TeamTest < MiniTest::Test

  def setup()
    @team_liv = Team.new('name' => 'Liverpool')
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
