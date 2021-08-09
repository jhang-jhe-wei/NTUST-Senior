json = Kamiflex.json(self) do
  alt_text "台科不分系學長 向您傳送了聯絡資訊"
      bubble do
        body do
          text "台科不分系學姊", wrap: true, weight: :bold
          separator
          text "台科不分系學姊是專為全校不分系新生製作的聊天機器人，在這裡你可以得到新生引導、社團列表、訂閱通知等各式資訊，歡迎使用！", wrap: true, size: :sm, margin: :lg
          horizontal_box action: uri_action("https://lin.ee/230X97m"), borderColor: "#AAAAAA", borderWidth: :light, cornerRadius: :lg, margin: :xl do
            horizontal_box paddingAll: "10px" do
              horizontal_box cornerRadius: :xxl, width: "40px", height: "40px" do
                image "https://i.ytimg.com/vi/KfYCs9SbyN0/maxresdefault.jpg"
              end
              text "馬上使用", wrap: true, size: :lg, margin: :md, gravity: :center, weight: :bold, flex: 3, align: :center
              text "👉🏻", color: "#AAAAAA", wrap: true, size: :md, gravity: :center, align: :end
            end
          end
        end
      end
end

puts json