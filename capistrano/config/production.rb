
set   :domain,            "DOMAIN OF PRODUCTION SERVER"
set   :deploy_to,         "DIRECTORY IN THE SERVER TO DEPLOY CODE"
set   :user,              "SSH DEPLOY USER"
set   :use_sudo,          false

set   :symfony_env_prod,  "prod"

role  :web,        domain
role  :app,        domain
role  :db,         domain

set   :parameters_file, "parameters.production.yml"


set :shared_files,     [app_config_path + "/parameters.yml"]


after "deploy:setup", "deploy:upload_parameters"

before "deploy", "build:all"
#after "symfony:cache:warmup", "deploy:migrate_database"
after "symfony:cache:warmup", "deploy:builddb"
after "deploy", "deploy:delete_build_files"
after "deploy", "deploy:cleanup"