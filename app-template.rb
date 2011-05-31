rvmrc = <<-RVMRC
rvm use 1.8.7@#{app_name} --create
RVMRC

create_file ".rvmrc", rvmrc

gem "jquery-rails", ">= 1.0.3"
gem "haml-rails", ">= 0.3.4"
gem "rake", "0.8.7"
gem "factory_girl_rails", ">= 1.0.0", :group => :test
gem "factory_girl_generator", ">= 0.0.1", :group => [:development, :test]
gem "rspec-rails", ">= 2.2.1", :group => [:development, :test]

generators = <<-GENERATORS

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.integration_tool :rspec, :fixture => true, :views => true
    end
GENERATORS

application generators

layout = <<-LAYOUT
!!!
%html
  %head
    %title #{app_name.humanize}
    = stylesheet_link_tag :all
    = javascript_include_tag :defaults
    = csrf_meta_tag
  %body
    = yield
LAYOUT

remove_file "app/views/layouts/application.html.erb"
create_file "app/views/layouts/application.html.haml", layout

create_file "log/.gitkeep"
create_file "tmp/.gitkeep"

git :init
git :add => "."

docs = <<-DOCS

Run the following commands to complete the setup of #{app_name.humanize}:

% cd #{app_name}
% gem install bundler
% bundle install
% rails generate rspec:install
% rails generate jquery:install

DOCS

log docs
