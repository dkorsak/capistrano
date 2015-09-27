desc "Update vendors"
task :composerupdate do
    capifony_pretty_print "--> Update vendors"
    system("#{php_bin} ./composer.phar update")
end
