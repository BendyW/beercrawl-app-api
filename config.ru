require 'sinatra/base'

require './controllers/application_controller'
require './controllers/user_controller'
require './controllers/event_controller'
require './controllers/team_controller'
require './controllers/challenge_controller'

require './models/user'
require './models/event'
require './models/team'
require './models/challenge'

map ('/api/users/') { run UserController}
map ('/api/events/') { run EventController}
map ('/api/teams/') { run TeamController}
map ('/api/challenges/') { run ChallengeController}