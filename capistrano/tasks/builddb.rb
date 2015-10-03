desc "Drop and create local database. Load schema and fixtures"
task :builddb do
    env = fetch(:env, symfony_env_local)
    capifony_pretty_print "--> Building local database for environment #{env}"
    system("#{php_bin} #{symfony_console} doctrine:database:drop --env=#{env} --force")
    system("#{php_bin} #{symfony_console} doctrine:database:create --env=#{env}")
    system("#{php_bin} #{symfony_console} doctrine:schema:create --env=#{env}")
    #system("#{php_bin} #{symfony_console} doctrine:fixtures:load --env=#{env} --no-interaction")
end
