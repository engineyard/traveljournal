rvmrc = <<-RVMRC
rvm use 1.9.2@#{app_name} --create
RVMRC

create_file ".rvmrc", rvmrc

gem "factory_girl_rails", ">= 1.1.0", :group => :test
gem "factory_girl_generator", ">= 0.0.3", :group => [:development, :test]
gem "rspec-rails", ">= 2.6.1", :group => [:development, :test]

generators = <<-GENERATORS

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.integration_tool :rspec, :fixture => true, :views => true
    end
GENERATORS

application generators

create_file "log/.gitkeep"
create_file "tmp/.gitkeep"

git :init
git :add => "."

docs = <<-DOCS

Run the following commands to complete the setup of #{app_name.humanize}:

% cd #{app_name}
% bundle install
% rails generate rspec:install

DOCS

log docs
