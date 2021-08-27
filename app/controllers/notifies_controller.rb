class NotifiesController < ApplicationController
  http_basic_authenticate_with :name => ENV["HTTP_AUTH_USERNAME"], :password => ENV["HTTP_AUTH_PASSWORD"], only: [:version, :version_notify, :calendar, :calendar_notify]
  skip_before_action :verify_authenticity_token, only: [:email_notify]
  def index
    @auth_link = LineNotify.get_auth_link(current_user.line_id)
  end

  def version
    data = GetGithubReleases.new.perform
    @tag_name = data[0]["tag_name"]
    @content = data[0]["body"]
  end

  def version_notify
    data = GetGithubReleases.new.perform
    notify_type = "版本更新通知"
    message = "\n\n版本更新通知\n\n💎 最新版本號：#{data[0]['tag_name']}\n\n本次更新內容為以下：\n\n#{data[0]['body'].gsub!('#','📋').gsub!('-','📌')}"
    SubscriptionDispatch.new(notify_type, message).perform
    redirect_to version_notify_path, notice: "訊息已傳送！"
  end

  def calendar
    @event_list = calendar_events_list["items"]
  end

  def calendar_notify
    CalendarEventsNotify.new.perform
    redirect_to calendar_notify_path, notice: "訊息已傳送！"
  end

  def course
  end

  def course_notify
    user = User.find_by(line_id: params[:user_id])
    user.update!(crosslink_url: params[:url])
    LoadCourse.new(user).perform
    user.subscriptions.find_or_create_by(notify_type: "上課提醒", user_id: user.id)
    render status: 200, json: {status: "OK"}
  end

  def email_notify
    notify_type = "台科大大宗郵件"
    message = "\n\n【台科大大宗郵件】\n【#{params.dig(:output_data, :info_type)}】\n#{params.dig(:output_data, :info_title)}\n#{params.dig(:output_data, :link_path)}"
    SubscriptionDispatch.new(notify_type, message).perform
    render status: 200, json: {status: "OK"}
  end

  def callback
    code = params[:code]
    current_user = User.find_by(line_id: params[:state])
    token = LineNotify.get_token(code)
    if current_user.line_notify_token
      LineNotify.revoke(current_user.line_notify_token)
    end
    current_user.update(line_notify_token: token)
    LineNotify.send(token, message: "設定成功！恭喜你與台科不分系學姊更親近一步了！")
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
