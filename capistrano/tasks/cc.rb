
desc "Rebuild local project"
task :cc do
    FileUtils.rm_rf(cache_path + "/dev")
    FileUtils.rm_rf(cache_path + "/prod")
    env = fetch(:env, symfony_env_prod)
    system("#{php_bin} #{symfony_console} cache:warmup --env=#{env} --no-interaction --no-debug")
    system("#{php_bin} #{symfony_console} assets:install web --symlink")
    system("#{php_bin} #{symfony_console} assetic:dump --env=#{env} --no-debug")
    system("#{php_bin} #{symfony_console} doctrine:cache:clear-query --env=#{env}")
    system("#{php_bin} #{symfony_console} doctrine:cache:clear-result --env=#{env}")
    system("#{php_bin} #{symfony_console} doctrine:cache:clear-metadata --env=#{env}")
end
