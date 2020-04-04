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
