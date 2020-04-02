require('pry-byebug')
require_relative('../models/team.rb')

team_liv = Team.new('name' => 'Liverpool')
team_liv.save()

team_mci = Team.new('name' => 'Manchester City')
team_mci.save()








binding.pry
nil
