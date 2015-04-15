set :application, 'application'

set :repo_url, "git@bitbucket.org:ueiek/indiano.git"
set :unicorn_config_path, "#{current_path}/config/production/unicorn/unicorn.rb"
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/sitemaps')
namespace :deploy do
  task :setup do
    before "deploy:migrate", :create_db
    invoke :deploy
  end
  desc 'Runs rake db:seed'
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end
  task :create_db do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:create"
        end
      end
    end
  end
  task :restart do
  end
  task :update_code do
  end
end

namespace :sitemaps do
  task :create_symlink do
    on roles(:web) do
      run "mkdir -p #{shared_path}/sitemaps"
      run "rm -rf #{release_path}/public/sitemaps"
      run "ln -s #{shared_path}/sitemaps #{release_path}/public/sitemaps"
    end
  end
end
before :deploy, 'git:push'
before 'deploy:setup', 'git:push'
after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded
after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime
after "deploy:update_code", "sitemaps:create_symlink"
