require_relative('../db/sql_runner')
require_relative('./team')

class Player

  attr_accessor :first_name, :last_name, :goals,
                :assists, :yellow_cards, :red_cards
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @team_id = options['team_id'].to_i
    @goals = options['goals'].to_i if options['goals']
    @assists = options['assists'].to_i if options['assists']
    @yellow_cards = options['yellow_cards'].to_i if options['yellow_cards']
    @red_cards = options['red_cards'].to_i if options['red_cards']
  end

  def save()
    sql = "INSERT INTO players
           (first_name, last_name, team_id, goals,
            assists, red_cards, yellow_cards)
            VALUES ($1, $2, $3, $4, $5, $6, $7)
            RETURNING *"
    values = [@first_name, @last_name, @team_id, @goals,
              @assists, @red_cards, @yellow_cards]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def Player.all()
    sql = "SELECT * FROM players"
    result = SqlRunner.run(sql, [])
    return result.map {|player| Player.new(player)}
  end

  def update()
    sql = "UPDATE players
           SET
             first_name = $1,
             last_name = $2,
             team_id = $3,
             goals = $4,
             assists = $5,
             yellow_cards = $6,
             red_cards = $7
           WHERE id = $8"
    values = [@first_name, @last_name, @team_id, @goals,
              @assists, @yellow_cards, @red_cards, @id]
    SqlRunner.run(sql, values)
  end

  def Player.delete_all()
    sql = "DELETE FROM players"
    SqlRunner.run(sql, [])
  end

  def Player.delete(id)
    sql = "DELETE FROM players WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
