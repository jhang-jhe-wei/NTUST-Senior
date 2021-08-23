namespace :line do
  desc "Send Calendar events which occur in 7 days to Subscriber."
  task calendar_notify: :environment do
    CalendarEventsNotify.new.perform
  end

  desc "Send remind of class to notify students to take tomorrow."
  task course_notify: :environment do
    CourseNotify.new.perform
  end
end
