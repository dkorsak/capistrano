
desc "Executing PHPUnit tests without code coverage."
task :pu do
  capifony_pretty_print "--> Executing PHPUnit tests without code coverage"
  system("#{php_bin} #{bin_path}/phpunit -v -c #{app_path}/phpunit.xml --debug --stderr --log-junit '#{test_result_path}/phpunit.xml'")
end
