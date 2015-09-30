set :application,      "Project Name"

set :stages,        %w(local dev)
set :default_stage, "local"
set :stage_dir,     "capistrano/config"
require 'capistrano/ext/multistage'


set :deploy_to,        "local copy"
set :app_path,         "app"
set :web_path,         "web"
set :bin_path,         "bin"
set :test_result_path, "test_result"
set :parameters_dir,   app_config_path
set :parameters_file,  false


set :scm,              :none
set :repository,       Dir.getwd
set :deploy_via,       :copy
set :use_composer,     true

set :model_manager,    "doctrine"
set :keep_releases,    2
set :use_composer,     true

set :enable_mess_detector_debug, false

set :shared_files,     [app_config_path + "/parameters.yml", app_config_path + "/parameters.yml.dist"]
set :shared_children,  [app_path + "/logs", web_path + "/uploads", "vendor"]
set :copy_exclude,     [app_config_path + "/parameters*", "bin", app_path + "/logs", app_path + "/cache", "vendor", "capistrano", "composer.phar", test_result_path, ".git", ".gitignore", ".idea", "Capfile"]
set :interactive_mode, false

default_run_options[:pty] = true

logger.level = Logger::MAX_LEVEL


before "deploy", "build:all"
after "deploy", "deploy:delete_build_files"
after "deploy", "deploy:cleanup"