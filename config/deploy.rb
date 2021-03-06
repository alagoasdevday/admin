# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'admin.alagoasdevday.com.br'
set :repo_url, 'git@github.com:alagoasdevday/admin.git'
set :base_path, "/var/www/rails/admin.alagoasdevday.com.br"
set :ruby_version, "2.2.0"
set :ruby_gemset, "admin.alagoasdevday.com.br"
ask :user, "root"
ask :server, "example.com"

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/secrets.yml config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for keep_releases is 5
set :keep_releases, 10

set :ssh_options, {
  forward_agent: true
}

server fetch(:server), user: fetch(:user), roles: %w{web app db}, primary: true

SSHKit.config.command_map[:rake]  = "bundle exec rake" #8
SSHKit.config.command_map[:rails] = "bundle exec rails"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
