class SystemEventsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:github]
    before_action :verify_signature, only: :github

    def github
        if params.dig(:system_event, :action) == "published"
            version = params.dig(:release, :tag_name)
            body = params.dig(:release, :body).gsub('#', 'ð').gsub('-', 'ð')
            message = "\n\nçæ¬æ´æ°éç¥\n\nð ææ°çæ¬èï¼#{version}\n\næ¬æ¬¡æ´æ°å§å®¹çºä»¥ä¸ï¼\n\n#{body}"
            SubscriptionDispatch.new("çæ¬æ´æ°éç¥", message).perform
        end
        render status: 200, json: {status: "OK"}
    end

    private

    def verify_signature
        request.body.rewind
        payload_body = request.body.read
        signature = 'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['GITHUB_WEBHOOK_SECRET'], payload_body)
        render plain: "Signatures didn't match!", status: 403 unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE_256'])
    end
end
