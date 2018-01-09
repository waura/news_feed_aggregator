# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'news_feed_aggregator'
set :repo_url, 'git@github.com:waura/news_feed_aggregator.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/var/www/awesome-events/news_feed_aggregator'

# Default value for :scm is :git
set :scm, :git

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# Default value for default_env is {}
set :default_env, {
#  rbenv_root: "/usr/local/rbenv",
#  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
  "USE_SYSTEM_GECODE" => 1
}

# To avoid error of 'gem install nokogiri'
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }

# Default value for keep_releases is 5
set :keep_releases, 5

# add symlink target to shared directory
set :linked_dirs, (fetch(:linked_dirs) + ['tmp/pids'])

# setting for unicorn
set :unicorn_rack_env, "none"
set :unicorn_config_path, 'config/unicorn.rb'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Initial data setup to database'
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end

  desc 'Update Entries'
  task :fetch_feed do
    execute :rails, "runner Tasks::FetchFeed.execute"
  end

end
