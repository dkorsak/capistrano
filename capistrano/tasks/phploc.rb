# phploc is a tool for quickly measuring the size and analyzing the structure of a PHP project
# requires "phploc/phploc" in the composer.jsn file require-dev section
# more details https://github.com/sebastianbergmann/phploc

task :phploc do
    capifony_pretty_print "--> Creating measure project size using report"
    system("#{php_bin} #{bin_path}/phploc  --log-csv #{test_result_path}/phploc.csv --exclude /**/**/Resources src")
end
