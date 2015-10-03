# PHP_Depend is an adaption of the established Java development tool JDepend.
# This tool shows you the quality of your design in the terms of extensibility, reusability and maintainability.
# requires "pdepend/pdepend" in the composer.json require-dev section
# more details http://pdepend.org/

desc "Creating software metrics report using PHP_Depend"
task :pdepend do
    capifony_pretty_print "-->  Creating software metrics report using PHP_Depend"
    ignore = "--ignore=*/Resources,*/**/Resources"
    system("#{php_bin} #{bin_path}/pdepend #{ignore} --jdepend-xml=#{test_result_path}/pdepend-jdepend.xml --jdepend-chart=#{test_result_path}/pdepend-dependencies.svg --overview-pyramid=#{test_result_path}/pdepend-overview-pyramid.svg src")
end
