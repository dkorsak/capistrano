namespace :deploy do
    task :upload_parameters do
        origin_file = parameters_dir + "/" + parameters_file if parameters_dir && parameters_file
        if origin_file && File.exists?(origin_file)
            ext = File.extname(parameters_file)
            relative_path = "app/config/parameters" + ext

            if shared_files && shared_files.include?(relative_path)
                destination_file = shared_path + "/" + relative_path
            else
                destination_file = latest_release + "/" + relative_path
            end
            try_sudo "mkdir -p #{File.dirname(destination_file)}"

            top.upload(origin_file, destination_file)
        end
    end
end