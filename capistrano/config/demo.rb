
set   :domain,            "demo.redexperts.net"
set   :deploy_to,         "/var/www/vhosts/redexperts.net/subdomains/symfony-sandbox.demo/httpdocs"
set   :user,              "jenkins"
set   :use_sudo,          false

set   :symfony_env_prod,  "prod"

role  :web,        domain
role  :app,        domain
role  :db,         domain

set   :parameters_file, "parameters.demo.yml"

after "deploy:setup", "deploy:upload_parameters"

before "deploy", "build:all"
#after "symfony:cache:warmup", "deploy:migrate_database"
after "symfony:cache:warmup", "deploy:builddb"
after "deploy", "deploy:delete_build_files"
after "deploy", "deploy:cleanup"