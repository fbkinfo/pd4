require "bundler/capistrano"

server "5.79.68.25", :web, :app, :db, primary: true

set :user, "webmaster"
set :application, "pd4"
set :deploy_to, "/home/#{user}/projects/#{application}"
set :use_sudo, false
# set :default_environment, {
#   'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
# }

set :scm, :git
set :repository, "git@github.com:fbkinfo/pd4.git"
set :deploy_via, :remote_cache
set :branch, 'master'

# default_run_options[:pty] = true
# ssh_options[:forward_agent] = true

namespace :database do
  desc "Symlink shared files and folders"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "rm -Rf #{release_path}/public/uploads"
    run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
  end
  after "deploy:finalize_update", "database:symlink"
end

namespace :puma do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command, roles: :app do
      run "sudo service #{application} #{command}"
    end
    after "deploy:#{command}", "puma:#{command}"
  end
end

after "deploy", "deploy:cleanup" # keep only the last 5 releases