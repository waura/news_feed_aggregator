# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

# Includes tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#
# require 'capistrano/rvm'
# require 'capistrano/rbenv'
# require 'capistrano/chruby'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'

set :whenever_command, "bundle exec whenever"
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
require 'whenever/capistrano'

## rbenv
#require 'capistrano/rbenv'
#set :rbenv_type, :user # or :system
#set :rbenv_ruby, '2.1.6'

set :linked_files, %w{config/secrets.yml .env}

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
