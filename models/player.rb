class Player

  attr_accessor :first_name, :last_name, :goals,
                :assists, :yellow_cards, :red_cards
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @team_id = options['team_id'].to_i
    @goals = 0
    @assists = 0
    @yellow_cards = 0
    @red_cards = 0
  end

end
