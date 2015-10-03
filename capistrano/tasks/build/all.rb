namespace :build do
    task :all do
        composer
        cc
    end
end