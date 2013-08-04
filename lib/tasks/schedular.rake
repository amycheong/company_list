desc "This task is called by the Heroku scheduler add-on"
task :update_all_likes => :environment do
  	Company.update_all_likes
end