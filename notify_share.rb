def cover
        bubble do
            header backgroundColor: "#F3D23C", layout: "horizontal" do
                text "通知服務", align: "center", color: "#ffffff", size: "xl", margin: "none", weight: "bold"
            end
            body do
                text "台科不分系學姊提供多種通知服務，有上課提醒、大宗郵件、行事曆等有用的訊息。加台科不分系學姊後，點擊或輸入「訂閱通知」即可了解如何使用。", wrap: true
            end
            footer paddingTop: "0px" do
                separator color: "#c2c2c2", margin: "xl"
                url_button "加入好友", "https://lin.ee/230X97m", style: "primary", color: "#F3D23C"
            end
        end
    end

    def page(title, content)
        bubble do
            header backgroundColor: "#F3D23C", layout: "horizontal" do
                text title, align: "center", color: "#ffffff", size: "xl", margin: "none", weight: "bold"
            end
            body do
                text content, wrap: true
            end
            footer paddingTop: "0px" do
                separator color: "#c2c2c2", margin: "xl"
                url_button "立刻使用", "https://lin.ee/230X97m", style: "primary", color: "#F3D23C"
            end
        end
    end
json = Kamiflex.hash(self) do
    carousel do
        cover
        page("上課提醒", "訂閱後每天晚上 10 點會通知你明天要上的課程哦！由於學校禁止第三方 APP 取得學生帳密，因此與選課模擬系統 CrossLink 串接，點擊後貼上個人頁面網址，取得課程資訊")
        page("台科大大宗郵件", "訂閱後學校的大宗郵件寄出時都會用 Line Notify 通知你哦！\n(改寫自 narihira2000 的 GAS-NTUST-bulletin)")
        page("台科大行事曆", "訂閱後每天都會通知你近 7 日有關於台科大的活動哦！")
        page("版本更新通知", "訂閱後有關於版本的更新都會通知你哦！")
    end
end.to_json

puts json
