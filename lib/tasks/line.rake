namespace :line do
  desc "Send Calendar events which occur in 7 days to Subscriber."
  task calendar_notify: :environment do
    CalendarEventsNotify.new.perform
  end

end
