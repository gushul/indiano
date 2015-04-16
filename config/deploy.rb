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
end

namespace :sitemaps do
  desc 'Generate sitemap'
  task :generate do
    on roles(:app) do
      within release_path do
        with rails_env: :production do
          execute :rake, 'sitemap:generate'
        end
      end
    end
  end
end
after 'deploy', 'sitemaps:generate'
after 'deploy', 'deploy:restart'
after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'   # app preloaded
after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime
