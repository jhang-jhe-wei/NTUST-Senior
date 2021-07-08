class NotifiesController < ApplicationController
  def index
    @notifies = Notify.all
    @auth_link = lotify.get_auth_link(current_user.line_id)
  end

  def callback
    code = params[:code]
    current_user = User.find_by(line_id: params[:state])
    token = lotify.get_token(code)
    if current_user.line_notify_token
      lotify.revoke(current_user.line_notify_token)
    end
    current_user.update(line_notify_token: token)
    response = lotify.send(token, message: "設定成功！恭喜你與台科不分系學姊更親近一步了！")
  end

  private

  def lotify
    Lotify::Client.new(
      client_id: ENV["LINE_NOTIFY_CLIENT_ID"],
      client_secret: ENV["LINE_NOTIFY_CLIENT_SECRET"],
      redirect_uri: ENV["LINE_NOTIFY_REDIRECT_URI"],
    )
  end
end
