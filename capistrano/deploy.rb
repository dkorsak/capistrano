set :application, "Project Name"
set :deploy_to,   "local copy"
set :app_path,    "app"
set :web_path,    "web"

set :scm,              :none
set :repository,       Dir.getwd
set :deploy_via,       :copy
set :use_composer,     true

set :model_manager,    "doctrine"
set :keep_releases,    3
set :use_composer,     true

set :shared_files,     []
set :shared_children,  [app_path + "/logs", web_path + "/uploads", "vendor"]
set :copy_exclude,     ["bin", app_path + "/logs", app_path + "/cache", "vendor"]
set :interactive_mode, false

default_run_options[:pty] = true

logger.level = Logger::MAX_LEVEL


set :stages,        %w(local dev)
set :default_stage, "local"
set :stage_dir,     "app/config"
require 'capistrano/ext/multistage'


before 'deploy', 'build:all'
