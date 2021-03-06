# requires "phpmd/phpmd" in the composer.json require-dev section
# more details http://phpmd.org/

desc "Creating PHP Mess Detector report"
task :phpmd do
    debug = fetch(:enable_mess_detector_debug, false)
    exclude = "--exclude Resources"
    capifony_pretty_print "--> Creating PHP Mess Detector report"
    if debug
        system("#{php_bin} #{bin_path}/phpmd ./src xml codesize,unusedcode,design --suffixes php #{exclude}")
    else
        system("#{php_bin} #{bin_path}/phpmd ./src xml codesize,unusedcode,design --suffixes php #{exclude} --reportfile '#{test_result_path}/pmd.xml'")
    end
end
