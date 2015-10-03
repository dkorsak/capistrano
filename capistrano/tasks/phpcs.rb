# checking Symfony2 coding standards
# requires "squizlabs/php_codesniffer" and "escapestudios/symfony2-coding-standard" in the composer.json required-dev section
# more details https://github.com/escapestudios/Symfony2-coding-standard
# more details https://github.com/squizlabs/PHP_CodeSniffer

task :phpcs do
    debug = fetch(:enable_coding_standard_debug, false)
    capifony_pretty_print "--> Creating Symfony 2 coding standard report"
    standard = "vendor/escapestudios/symfony2-coding-standard/Symfony2";
    if debug
        system("#{php_bin} #{bin_path}/phpcs -s --standard=#{standard} --extensions=php --report=full ./src")
    else
        system("#{php_bin} #{bin_path}/phpcs -s --standard=#{standard} --extensions=php --report=checkstyle --report=checkstyle --report-file=#{test_result_path}/checkstyle.xml ./src")
    end
end
