namespace :db do
  desc "Wipe database clean and start over"
  task :total_reset => :environment do
    Rake::Task['db:schema:dump'].invoke
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:schema:load'].invoke
    Rake::Task['db:seed'].invoke
  end
end
