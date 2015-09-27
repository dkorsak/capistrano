
desc "Executing PHPUnit tests with code coverage option."
task :phpunit do
  capifony_pretty_print "--> Executing PHPUnit tests with code coverage"
  FileUtils.rm_rf(cache_path + "/test")
  system("#{php_bin} #{symfony_console} cache:warmup --env=test --no-interaction --no-debug")
  system("#{php_bin} #{bin_path}/phpunit -v -c #{app_path}/phpunit.xml --coverage-html '#{test_result_path}/coverage' --coverage-clover '#{test_result_path}/clover.xml' --stderr --log-junit '#{test_result_path}/phpunit.xml'")
end

