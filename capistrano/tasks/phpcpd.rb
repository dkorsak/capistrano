# Copy/Paste Detector (CPD) for PHP code.
# requires "sebastian/phpcpd" in the composer.json required-dev section
# more details https://github.com/sebastianbergmann/phpcpd

task :phpcpd do
    debug = fetch(:enable_copy_paste_detector_debug, false)
    exclude = "--exclude Resources"
    min_tokens = "--min-tokens 50"
    min_lines = "--min-lines 5"
    capifony_pretty_print "-->  Creating copy/paste detector PHPCPD report"
    if debug
        system("#{php_bin} #{bin_path}/phpcpd #{exclude} #{min_tokens} #{min_lines} src")
    else
        system("#{php_bin} #{bin_path}/phpcpd #{exclude} #{min_tokens} #{min_lines} --log-pmd #{test_result_path}/pmd-cpd.xml --quiet src")
    end
end
