desc "Update vendors"
task :composerupdate do
    capifony_pretty_print "--> Updating vendors"
    system("#{php_bin} ./composer.phar update")
end
