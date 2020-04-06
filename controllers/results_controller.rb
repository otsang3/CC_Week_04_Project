require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/fixture')
require_relative('../models/player')
require_relative('../models/team')
also_reload('../models/*')

get '/results' do
  @fixtures = Fixture.all_with_results()
  @teams = Team.all()
  erb(:"results/index")
end

get '/results/filter' do
  @teams = Team.all()
  erb(:"results/filter")
end

get '/results/:id/edit' do
  id = params['id'].to_i
  @fixture = Fixture.find(id)
  @fixtures = Fixture.all()
  @teams = Team.all()
  erb(:"results/edit")
end

post '/results/:id/edit' do
  old_id = params['id'].to_i
  old_fixture = Fixture.find(old_id)
  amended_result = Fixture.new(params)
  amended_result.update
  # update team record and points
  new_id = params['id'].to_i
  new_fixture = Fixture.find(new_id)
  home_team = Fixture.home_team(new_fixture)
  away_team = Fixture.away_team(new_fixture)
  redirect to('/results')
end

post '/results/:id/delete' do
  Fixture.delete(params[:id])
  redirect to("/results")
end

get '/results/filter/result' do
  id = params[:id].to_i
  @id = id
  @fixtures = Fixture.find_all_played_games(id)
  @teams = Team.all()
  erb(:"results/filter_result")
end
