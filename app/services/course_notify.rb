class CourseNotify
  def perform
    subscriptions = Subscription.where(notify_type: "上課提醒")
    subscriptions.each do |subscription|
      message = subscription.user.has_course_times_on(wday).includes(:course).map do |course_time|
        text = ''
        text += "📖 #{course_time.course.name}\n"
        text += "⏰ #{course_time.section}\n"
        text += "🏫 #{course_time.place || course_time.course.school}"
        text
      end&.join("\n\n")
      LineNotify.send(subscription.user.line_notify_token, message: "\n\n上課提醒\n\n#{message}") if message.present?
    end
  end

  private

  def wday
    case Date.tomorrow.wday
    when 0
      "sun"
    when 1
      "mon"
    when 2
      "thus"
    when 3
      "wed"
    when 4
      "thur"
    when 5
      "fri"
    when 6
      "sat"
    end
  end
end
