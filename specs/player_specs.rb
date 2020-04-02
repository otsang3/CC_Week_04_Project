require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/team')
require_relative('../models/player')
require_relative('../models/fixture')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class TeamTest < MiniTest::Test

  def setup()

    @team_liv = Team.new({'name' => 'Liverpool'})
    @team_mci = Team.new({'name' => 'Manchester City'})
    @fixture1 = Fixture.new({'home_team_id' => @team_liv.id,
                            'away_team_id' => @team_mci.id})
    @player = Player.new({
      'first_name' => 'Sadio',
      'last_name' => 'Mane',
      'team_id' => @team_liv.id
      })
  end

  def test_get_first_name()
    assert_equal('Sadio', @player.first_name)
  end

  def test_get_last_name()
    assert_equal('Mane', @player.last_name)
  end

  def test_get_goals()
    assert_equal(0, @player.goals)
  end

  def test_get_assists()
    assert_equal(0, @player.assists)
  end

  def test_get_red_cards()
    assert_equal(0, @player.red_cards)
  end

  def test_get_yellow_cards()
    assert_equal(0, @player.yellow_cards)
  end

end
