class SystemEventsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:github]
    before_action :verify_signature, only: :github

    def github
        if params.dig(:system_event, :action) == "published"
            version = params.dig(:release, :tag_name)
            body = params.dig(:release, :body).gsub('#', '📋').gsub('-', '📌')
            message = "\n\n版本更新通知\n\n💎 最新版本號：#{version}\n\n本次更新內容為以下：\n\n#{body}"
            SubscriptionDispatch.new("版本更新通知", message).perform
        end
        render status: 200, json: {status: "OK"}
    end

    private

    def verify_signature
        token = "qq"
        request.body.rewind
        payload_body = request.body.read
        signature = 'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), token, payload_body)
        render plain: "Signatures didn't match!", status: 403 unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE_256'])
    end
end
