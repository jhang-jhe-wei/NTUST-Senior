class SystemEventsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:github]
    def github
        if params.dig(:system_event, :action) == "published"
            version = params.dig(:release, :tag_name)
            body = params.dig(:release, :body).gsub!('#', '📋').gsub!('-', '📌')
            subscriptions = Subscription.where("notify_type = ?", "版本更新通知")
            subscriptions.each do |subscription|
              LineNotify.send(subscription.user.line_notify_token, message: "\n\n版本更新通知\n\n💎 最新版本號：#{version}\n\n本次更新內容為以下：\n\n#{body}")
            end
        end
        render status: 200, json: {status: "OK"}
    end
end
