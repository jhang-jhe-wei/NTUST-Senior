require 'rails_helper'

RSpec.describe "SystemEvents", type: :request do
  describe "Test github webhook" do
    it "works! (now write some real specs)" do
      expect(LineNotify).to receive(:send).with(nil, message: "\n\n版本更新通知\n\n💎 最新版本號：0.3.0\n\n本次更新內容為以下：\n\n📋 新增功能\r\n📌 台科大行事曆訂閱\r\n")
      Subscription.create(notify_type: "版本更新通知", user: User.create)
      post "/github/webhook", params: {
        system_event: {
          action: "published"
        },
        release: {
          tag_name: "0.3.0",
          body: "📋 新增功能\r\n📌 台科大行事曆訂閱\r\n"
        }
      }, headers: {
        "HTTP_X_HUB_SIGNATURE_256": "sha256=7b4c2b945337f100de39156622ee576790a3bacc9c301c7085c15c56c043f1e9"
      }
      expect(response).to have_http_status(200)
    end
  end
end
