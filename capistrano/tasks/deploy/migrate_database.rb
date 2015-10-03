namespace :deploy do
    task :migrate_database do
        run "cd #{latest_release} && app/console doctrine:migrations:migrate --no-interaction"
    end
end