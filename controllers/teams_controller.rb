require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/fixture')
require_relative('../models/player')
require_relative('../models/team')
also_reload('../models/*')

get '/teams' do
  @teams = Team.all()
  erb(:"team/index")
end

get '/teams/all' do
  @teams = Team.all()
  erb(:"team/all")
end

get '/teams/new' do
  erb(:"team/new")
end

post '/teams' do
  new_team = Team.new(params)
  new_team.save()
  @teams = Team.all()
  erb(:"team/all")
end

post '/teams/:id/delete' do
  Team.delete(params[:id])
  redirect to("/teams")
end

get '/teams/:id/edit' do
  id = params['id'].to_i
  @team = Team.find(id)
  @teams = Team.all()
  erb(:"team/edit")
end

post '/teams/:id/edit' do
  team = Team.new(params)
  team.update
  redirect to("/teams")
end
