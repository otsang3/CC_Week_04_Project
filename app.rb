require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/edit_controller')
require_relative('./controllers/fixtures_controller')
require_relative('./controllers/stats_controller')
require_relative('./controllers/table_controller')

get '/' do
  erb(:index)
end
