desc "This task is called by the Heroku scheduler add-on"

task :send_60_day_reminders => :environment do
  WaterRight.send_reminders(60.days)
end

task :send_30_day_reminders => :environment do
  WaterRight.send_reminders(30.days)
end

task :send_1_day_reminders => :environment do
  WaterRight.send_reminders(1.day)
end