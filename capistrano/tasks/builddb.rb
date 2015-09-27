
desc "Drop and create local database. Load schema and fixtures"
task :builddb do
  env = fetch(:env, symfony_env_local)
  capifony_pretty_print "--> Building assets in copy strategy"
  puts "#{php_bin} #{symfony_console} doctrine:database:drop --env=#{env} --force"
  puts "#{php_bin} #{symfony_console} doctrine:database:create --env=#{env}"
  puts "#{php_bin} #{symfony_console} doctrine:schema:create --env=#{env}"
  #exec("#{php_bin} #{symfony_console} doctrine:fixtures:load --env=#{env} --no-interaction")
  out = run_locally "ls -all"

  puts out

  if fixtures_load
    #system("ls -all")
    exec("ls -all")
  end
  capifony_puts_ok
end
