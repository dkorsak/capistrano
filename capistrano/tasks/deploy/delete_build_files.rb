namespace :deploy do
    task :delete_build_files do
        capifony_pretty_print "--> Cleaning current release"
        run "cd #{current_path} && rm composer.*"
        run "cd #{current_path} && rm REVISION"
    end
end