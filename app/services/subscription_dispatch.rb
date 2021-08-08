class SubscriptionDispatch
  def initialize(notify_type, message)
    @notify_type = notify_type
    @message = message
  end

  def perform
    subscriptions = Subscription.where(notify_type: @notify_type)

    subscriptions.each do |subscription|
      LineNotify.send(subscription.user.line_notify_token, message: @message)
    end
  end
end