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

get '/results/:id/edit' do
  id = params['id'].to_i
  @fixture = Fixture.find(id)
  @fixtures = Fixture.all()
  @teams = Team.all()
  erb(:"results/edit")
end

post '/results/:id/edit' do
  amended_result = Fixture.new(params)
  amended_result.update
  redirect to('/results')
end
