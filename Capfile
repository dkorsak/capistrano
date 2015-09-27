load 'deploy' if respond_to?(:namespace)

require 'capifony_symfony2'

Dir["capistrano/tasks/**/*.rb"].each { |task| load(task) }

load 'capistrano/deploy'


