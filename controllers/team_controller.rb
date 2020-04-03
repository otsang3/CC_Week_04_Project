require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/fixture')
require_relative('../models/player')
require_relative('../models/team')
also_reload('../models/*')

get '/team' do
  erb(:"team/index")
end

get '/team/new' do
  erb(:"team/new")
end

post '/team' do
  new_team = Team.new(params)
  new_team.save()
  erb(:"team/create")
end
