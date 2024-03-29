# every 1.minute do
#   runner "MyJob.perform_later"
# end
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# every 1.minute do
#   runner "MyJob.perform_now"
# end

every 1.minute do
  rake 'my_namespace:task1'
  runner 'update_work:my_task'
end

every 1.day, at: '6:00 pm' do
  rake 'my_namespace:task3'
end



# every 1.minute do
#   rake 'my_namespace:task3'
# end

every 1.day, at: '4:16 pm' do
  runner 'my_namespace:task5'
end

every 1.day, at: '5:35 pm' do
  runner 'my_namespace:task4'
end


# every 1.day, at: '5:32 pm' do
#   runner 'my_namespace:task5'
# end