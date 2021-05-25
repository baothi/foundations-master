# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/puma'
require 'capistrano/rails/assets'
require 'capistrano/faster_assets'
require 'capistrano/rails/migrations'
require 'capistrano/linked_files'
require 'capistrano/rails/console'

# If you are using rbenv add these lines: https://gorails.com/deploy/ubuntu/14.04
require 'capistrano/rbenv'
# set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.2.2'

require 'capistrano/puma'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
