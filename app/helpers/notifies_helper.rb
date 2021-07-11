module NotifiesHelper
    def cover
        bubble do
            header backgroundColor: "#F3D23C", layout: "horizontal" do
                text "Line Notify", align: "center", color: "#ffffff", size: "xl", margin: "none", weight: "bold"
            end
            body do
                text "LINE Notify 是一個「訊息推播」服務，點擊下方的設定說明，你將了解到如何設定 LINE Notify，設定完成後，你將可以訂閱右邊列表的各式通知。", wrap: true
            end
            footer paddingTop: "0px" do
                separator color: "#c2c2c2", margin: "xl"
                message_button "設定說明", "notify操作說明"
                url_button "開始設定", @auth_link, style: "primary", color: "#F3D23C"
            end
        end
    end

    def page(title, content, notify_id)
        bubble do
            header backgroundColor: "#F3D23C", layout: "horizontal" do
                text title, align: "center", color: "#ffffff", size: "xl", margin: "none", weight: "bold"
            end
            body do
                text content, wrap: true
            end
            footer paddingTop: "0px" do
                separator color: "#c2c2c2", margin: "xl"
                message_button "取消訂閱", "取消通知#{notify_id}"
                message_button "開始訂閱", "訂閱通知#{notify_id}", style: "primary", color: "#F3D23C"
            end
        end
    end
end
