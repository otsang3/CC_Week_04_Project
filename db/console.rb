require('pry-byebug')
require_relative('../models/team.rb')

team_liv = Team.new('name' => 'Liverpool')
team_liv.save()







binding.pry
nil
