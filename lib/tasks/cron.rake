desc "Cron task for heroku"
task :cron => :environment do
  Rake::Task["tag_sniphs"].invoke
end