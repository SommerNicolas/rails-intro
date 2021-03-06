# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "rails-intro"
set :repo_url, "git@github.com:SommerNicolas/rails-intro.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/nicolas/www/rails-intro"

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
	after :finished, :restart_puma do
		on roles(:web) do 
			execute :sudo, 'service puma-nicolas restart'
			execute :sudo, 'service nginx reload'
		end
	end
end

prefix = "set -a; . ~/.envfile; set +a"
[:bundle, :rake, :rails].each do |cmd|
	SSHKit.config.command_map.prefix[cmd].push(prefix)
end
