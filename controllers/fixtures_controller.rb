require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/fixture')
require_relative('../models/player')
require_relative('../models/team')
also_reload('../models/*')


get '/fixtures/test' do
  id = params['id'].to_i
  @fixtures = Fixture.find(id)
  @teams = Team.all()
  erb(:"fixtures/test")
end

get '/fixtures' do
  @fixtures = Fixture.all()
  @teams = Team.all()
  erb(:"fixtures/index")
end

get '/fixtures/new' do
  @fixtures = Fixture.all()
  @teams = Team.all()
  erb(:"fixtures/new")
end

get '/fixtures/filter' do
  @teams = Team.all()
  erb(:"fixtures/filter")
end

post '/fixtures/:id/delete' do
  Fixture.delete(params[:id])
  redirect to("/fixtures")
end

post '/fixtures' do
  new_fixture = Fixture.new(params)
  new_fixture.save
  redirect to("fixtures")
end

get '/fixtures/:id/edit' do
  id = params['id'].to_i
  @fixture = Fixture.find(id)
  @fixtures = Fixture.all()
  @teams = Team.all()
  erb(:"fixtures/edit")
end

post '/fixtures/:id/edit' do
  amended_fixture = Fixture.new(params)
  amended_fixture.update
  redirect to('/fixtures')
end

get '/fixtures/:id/fixtures' do
  id = params['id'].to_i
  @fixture = Fixture.find(id)
  @fixtures = Fixture.all()
  @teams = Team.all()
  erb(:"fixtures/fixtures")
end
