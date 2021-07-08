class SubscriptionsController < ApplicationController
  before_action :has_token?
  def subscribe
    if Subscription.find_by(subscription_params)
      render json: { type: "text", text: "你已訂閱過此通知！" }
    else
      subscription = Subscription.new(subscription_params)
      if subscription.save
        current_user.subscriptions << subscription
        lotify.send(current_user.line_notify_token, message: "#{subscription.notify.name} 訂閱成功！")
        render json: { type: "text", text: "恭喜你完成 #{subscription.notify.name} 的訂閱！" }
      else
        render json: { type: "text", text: subscription.errors.to_s }
      end
    end
  end


  private

  def has_token?
    render json: { type: "text", text: "你還沒有完成設定！請先點擊最左側的開始設定。" } unless current_user.line_notify_token
  end

  def subscription_params
    params[:user_id] = current_user.id
    params.permit(:user_id, :notify_id)
  end

  def lotify
    Lotify::Client.new(
      client_id: ENV["LINE_NOTIFY_CLIENT_ID"],
      client_secret: ENV["LINE_NOTIFY_CLIENT_SECRET"],
      redirect_uri: ENV["LINE_NOTIFY_REDIRECT_URI"],
    )
  end
end
