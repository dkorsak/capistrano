# Generates a browsable representation of PHP code where sections with violations
# found by quality assurance tools such as PHP_CodeSniffer or PHPMD are highlighted.
# requires "mayflower/php-codebrowser" in the composer.json required-dev section
# more details https://github.com/Mayflower/PHP_CodeBrowser

desc "Aggregating output with PHP_CodeBrowser"
task :phpcb do
    capifony_pretty_print "-->  Aggregating output with PHP_CodeBrowser"
    exclude = "-e /**/Resources,/**/**/Resources"
    system("#{php_bin} #{bin_path}/phpcb #{exclude} --log #{test_result_path} --source src --output #{test_result_path}/code-browser")
end
