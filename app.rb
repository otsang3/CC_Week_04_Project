require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/results_controller')
require_relative('./controllers/teams_controller')
require_relative('./controllers/fixtures_controller')
require_relative('./controllers/stats_controller')
require_relative('./controllers/tables_controller')
also_reload('./models/*')

get '/' do
  erb(:index)
end
