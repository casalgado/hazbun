
namespace :db do
  desc "Prepare test database"
  task :prepare => :environment do
		Rake::Task['db:test:prepare'].invoke
		Rake::Task['db:seed'].invoke

	end

end