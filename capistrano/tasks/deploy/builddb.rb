namespace :deploy do
    task :builddb do
        symfony.doctrine.database:drop
        symfony.doctrine.database:create
        symfony.doctrine.schema:create
        symfony.doctrine.load_fixtures
    end
end