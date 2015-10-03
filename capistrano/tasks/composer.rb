desc "Download composer.phar and install vendors."
task :composer do
    if !File.exists?("composer.phar")
        capifony_pretty_print "--> Downloading composer"
        system("curl -sSL https://getcomposer.org/installer | #{php_bin}")
    else
        capifony_pretty_print "--> Updating composer"
        system("#{php_bin} composer.phar self-update")
    end
    capifony_pretty_print "--> Installing vendors"
    system("#{php_bin} ./composer.phar install")
end
