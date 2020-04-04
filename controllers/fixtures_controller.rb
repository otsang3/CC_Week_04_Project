require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/fixture')
require_relative('../models/player')
require_relative('../models/team')
also_reload('../models/*')

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

post '/fixtures/:id/delete' do
  Fixture.delete(params[:id])
  redirect to("/fixtures")
end

post '/fixtures' do
  new_fixture = Fixture.new(params)
  new_fixture.save
  redirect to("fixtures")
end
