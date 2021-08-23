class SubscriptionsController < ApplicationController
  before_action :has_token?
  before_action :notify_present?

  def subscribe
    if Subscription.find_by(subscription_params)
      render json: { type: "text", text: "你已訂閱過此通知！" }
    else
      subscription = Subscription.new(subscription_params)
      if subscription.save
        current_user.subscriptions << subscription
        case subscription.notify_type
          when "台科大行事曆"
            LineNotify.send(current_user.line_notify_token, message: "#{subscription.notify_type} 訂閱成功！\n如果你比較習慣使用 Google Calendar 也可以點擊此連結 https://calendar.google.com/calendar/u/1?cid=YjEwNzMwMjI0QGdhcHBzLm50dXN0LmVkdS50dw 加入到你的 Google Calendar 。")
          else
            LineNotify.send(current_user.line_notify_token, message: "#{subscription.notify_type} 訂閱成功！")
        end
        render json: { type: "text", text: "恭喜你完成 #{subscription.notify_type} 的訂閱！" }
      else
        render json: { type: "text", text: subscription.errors.to_s }
      end
    end
  end

  def revoke
    subscription = Subscription.find_by(subscription_params)
    if subscription
      subscription.delete
      LineNotify.send(current_user.line_notify_token, message: "已取消訂閱 #{subscription.notify_type}")
      render json: { type: "text", text: "已取消該通知！" }
    else
      render json: { type: "text", text: "你沒有訂閱此通知！" }
    end
  end

  private

  def has_token?
    render json: { type: "text", text: "你還沒有完成設定！請先點擊最左側的開始設定。" } unless current_user.line_notify_token
  end

  def notify_present?
    notifies = ["版本更新通知", "台科大行事曆", "上課提醒"]
    render json: { type: "text", text: "沒有該通知，可能已被刪除或不存在！" } if notifies.exclude? params[:notify_type]
  end

  def subscription_params
    params[:user_id] = current_user.id
    params.permit(:user_id, :notify_type)
  end
end
