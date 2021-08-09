class CalendarEventsNotify
  def perform
    message = calendar_events_list['items']&.map do |event|
      "🗓 #{event.dig('summary')}  (#{event.dig('start', 'date')})"
    end&.join("\n\n")

    if message.present?
      message = "\n\n台科大行事曆\n\n近七日台科大活動如下：\n\n#{message}"
    else
      message = "\n\n台科大行事曆\n\n近七日沒有任何活動哦！祝你一切順心！"
    end

    SubscriptionDispatch.new("台科大行事曆", message).perform
  end

  private

  def calendar_events_list(duration = 7.days)
    calendar_id = "b10730224@gapps.ntust.edu.tw"
    url = "https://www.googleapis.com/calendar/v3/calendars/#{calendar_id}/events"
    response = Faraday.get(url, {
      key: ENV["GOOGLE_API_KEY"],
      singleEvents: true,
      order_by: "startTime",
      time_min: DateTime.now,
      time_max: DateTime.now + duration,
    })
    JSON.parse response.body
  end
end
