namespace :line do
  desc "Send Calendar events which occur in 7 days to Subscriber."
  task calendar_notify: :environment do
    CalendarEventsNotify.new.perform
  end

  desc "Send remind of class to notify students to take tomorrow."
  task course_notify: :environment do
    CourseNotify.new.perform
  end

  desc "Reload course for every subscriber"
  task reload_course: :environment do
    subscriptions = Subscription.where(notify_type: "上課提醒")
    subscriptions.each do |subscription|
      LoadCourse.new(subscription.user).perform
    end
  end

  desc "Update all courses detail in currnet semester"
  task update_all_courses: :environment do
    UpdateAllCourses.new.perform
  end
end
