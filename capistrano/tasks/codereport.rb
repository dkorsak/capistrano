
desc "Creating all code metrics for jenkins build"
task :codereport do
    FileUtils.rm_rf(test_result_path)
    FileUtils.mkdir_p(test_result_path)
    phpcs
    phpmd
    phpcpd
    pdepend
    phploc
    phpcb
end
