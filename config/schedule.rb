# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/tmp/cronlog.log"

every 1.days do
  #runner "RemindersController.send_welcome_email"
end

every 1.days do 
	runner "RemindersController.send_followup_reminders"
end


#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
