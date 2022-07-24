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
set :output, "log/cron_log.log"
env :PATH, ENV['PATH']
every 1.day, at: '8:00 am' do
  rake "line:calendar_notify"
end

every 1.day, at: '10:00 pm' do
  rake "line:course_notify"
end

# 每年 9 月的 5 號到 20 號每天都會重抓資料
every '0 0 5-20 9 *' do
  rake "line:reload_course"
end

# 每年 2 月的 10 號到 25 號每天都會重抓資料
every '0 0 10-25 2 *' do
  rake "line:reload_course"
end

