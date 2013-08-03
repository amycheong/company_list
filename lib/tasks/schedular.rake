desc "This task is called by the Heroku scheduler add-on"
task :update_all_likes => :environment do
  if Time.now.min % 2 == 0 

  	Company.update_all_likes

  end
end