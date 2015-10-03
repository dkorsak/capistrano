# Fixing symfony2 coding standards
# requires "fabpot/php-cs-fixer" in the composer.json require-dev section
# more details https://github.com/FriendsOfPHP/PHP-CS-Fixer

desc "Fixing coding standards"
task :fixcs do
     capifony_pretty_print "--> Fixing coding standards"
     system("#{php_bin} #{bin_path}/php-cs-fixer fix src")
end
