class NotifiesController < ApplicationController
  http_basic_authenticate_with :name => ENV["HTTP_AUTH_USERNAME"], :password => ENV["HTTP_AUTH_PASSWORD"], only: [:version, :version_notify]
  def index
    @auth_link = LineNotify.get_auth_link(current_user.line_id)
  end

  def version
    data = release_data
    @tag_name = data[0]["tag_name"]
    @content = data[0]["body"]
  end

  def version_notify
    data = release_data
    subscriptions = Subscription.where("notify_type = ?", "版本更新通知")
    subscriptions.each do |subscription|
      LineNotify.send(subscription.user.line_notify_token, message: "\n\n版本更新通知\n\n版本號：#{data[0]["tag_name"]}\n\n#{data[0]["body"]}")
    end
    redirect_to version_notify_path, notice: '訊息已傳送！'
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
  def release_data
    response = Faraday.get('https://api.github.com/repos/jhang-jhe-wei/NTUST-Senior/releases')
    JSON.parse response.body 
  end
end
