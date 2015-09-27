
set   :domain,            "dev.redexperts.net"
set   :deploy_to,         "/var/www/vhosts/redexperts.net/subdomains/symfony-sandbox.dev/httpdocs"
set   :user,              "jenkins"
set   :use_sudo,          false

set   :symfony_env_prod,  "prod"

role  :web,        domain
role  :app,        domain
role  :db,         domain

set   :parameters_file, "parameters.dev.yml"


after "deploy:setup", "deploy:upload_parameters"