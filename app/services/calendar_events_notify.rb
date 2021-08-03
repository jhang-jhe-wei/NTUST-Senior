class CalendarEventsNotify
  def initialize
    @message = ""
    calendar_events_list['items'].try(:each) do |event|
      @message += "🗓 #{event.dig('summary')}  (#{event.dig('start', 'date')})\n\n"
    end
  end

  def perform
    subscriptions = Subscription.where("notify_type = ?", "台科大行事曆")
    subscriptions.each do |subscription|
      if @message
        LineNotify.send(subscription.user.line_notify_token, message: "\n\n台科大行事曆\n\n近七日台科大活動如下：\n\n#{@message}")
      else
        LineNotify.send(subscription.user.line_notify_token, message: "\n\n台科大行事曆\n\n近七日沒有任何活動哦！祝你一切順心！")
      end
    end
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
