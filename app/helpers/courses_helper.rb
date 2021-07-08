module CoursesHelper
  def common_credit_overview
    bubble do
      body do
        vertical_box do
          text "四年制", weight: "bold", color: "#1DB446", size: "sm"
          text "共同必修科目表", weight: "bold", size: "xxl", margin: "md"
          text "110學年", size: "xs", color: "#aaaaaa", wrap: true
          vertical_box margin: "xxl", spacing: "sm" do
            separator color: "#cccccc"
            horizontal_box do
              text "社會實踐", color: "#555555", flex: 0, wrap: true
              text "1 學分", color: "#111111", align: "end"
            end
            separator color: "#cccccc"
            horizontal_box do
              text "國文", color: "#555555"
              vertical_box flex: 2, spacing: "md" do
                text "國文課4選1", size: "sm", color: "#111111", align: "start"
                text "新生中文說寫專題", size: "sm", color: "#111111", align: "start"
              end
              vertical_box spacing: "md" do
                text "3 學分", color: "#111111", align: "end"
                text "3 學分", color: "#111111", align: "end"
              end
            end
            separator color: "#cccccc"
            horizontal_box do
              text "英文", color: "#555555"
              vertical_box flex: 2, spacing: "md" do
                text "校內英文檢定", size: "sm", color: "#111111", align: "start"
                text "英文必選修課程", size: "sm", color: "#111111", align: "start"
              end
              vertical_box spacing: "md" do
                text "0 學分", color: "#111111", align: "end"
                text "12 學分", color: "#111111", align: "end"
              end
            end
            text "多益550分以上可抵免部分學分", color: "#aaaaaa", align: "end", size: "xs"

            separator color: "#cccccc"
            horizontal_box do
              text "通識", color: "#555555"
              vertical_box flex: 2, spacing: "md" do
                text "A~F向度選4種", size: "sm", color: "#111111", align: "start"
              end
              vertical_box spacing: "md" do
                text "15 學分", color: "#111111", align: "end"
              end
            end
            separator color: "#cccccc"
            horizontal_box do
              text "體育", color: "#555555"
              vertical_box flex: 2, spacing: "md" do
                text "一~三年級必修", size: "sm", color: "#111111", align: "start"
              end
              vertical_box spacing: "md" do
                text "0 學分", color: "#111111", align: "end"
              end
            end
            separator color: "#cccccc"
            horizontal_box do
              text "總計", color: "#555555"
              vertical_box spacing: "md" do
                text "34 學分", color: "#111111", align: "end"
              end
            end
          end
        end
      end
    end
  end

  def common_credit_chinese
    bubble do
      body do
        vertical_box do
          text "課程內容", weight: "bold", color: "#1DB446", size: "sm"
          text "國文", weight: "bold", size: "xxl", margin: "md"
          text "6 學分", size: "xs", color: "#aaaaaa", wrap: true
          vertical_box margin: "xxl", spacing: "sm" do
            separator color: "#cccccc"
            text "下列課程為必修(皆為3學分)：", margin: "md"
            text "📕 新生中文說寫專題", size: "sm", offsetStart: "xl", margin: "md"
            separator color: "#cccccc"
            text "下列課程選一門修(皆為3學分)：", margin: "md"
            text "📕 表達與文學閱讀", size: "sm", offsetStart: "xl", margin: "md"
            text "📕 表達與經典閱讀", size: "sm", offsetStart: "xl", margin: "md"
            text "📕 創意與文學閱讀", size: "sm", offsetStart: "xl", margin: "md"
            text "📕 創意與經典閱讀", size: "sm", offsetStart: "xl", margin: "md"
          end
        end
      end
      footer do
        separator color: "#cccccc"
        text "備註：", margin: "md"
        text "📌 國文課程上下學期皆會開課", size: "sm", offsetStart: "xl", margin: "md"
      end
    end
  end

  def common_credit_english
    bubble do
      body do
        vertical_box do
          text "課程內容", weight: "bold", color: "#1DB446", size: "sm"
          text "英文", weight: "bold", size: "xxl", margin: "md"
          text "12 學分", size: "xs", color: "#aaaaaa", wrap: true
          vertical_box margin: "xxl", spacing: "sm" do
            separator color: "#cccccc"
            text "下列為抵免前的英文必修：", margin: "md"
            horizontal_box margin: "md" do
              text "📕 校定英文能力檢測", size: "sm", offsetStart: "xl", flex: 4
              text "0學分", size: "sm", align: "end"
            end
            horizontal_box margin: "md" do
              text "📕 英文字彙與閱讀（上）", size: "sm", offsetStart: "xl", flex: 4
              text "2學分", size: "sm", align: "end"
            end
            horizontal_box margin: "md" do
              text "📕 英文字彙與閱讀（下）", size: "sm", offsetStart: "xl", flex: 4
              text "2學分", size: "sm", align: "end"
            end
            horizontal_box margin: "md" do
              text "📕 英語口語訓練（上）", size: "sm", offsetStart: "xl", flex: 4
              text "2學分", size: "sm", align: "end"
            end
            horizontal_box margin: "md" do
              text "📕 英語口語訓練（下）", size: "sm", offsetStart: "xl", flex: 4
              text "2學分", size: "sm", align: "end"
            end
            horizontal_box margin: "md" do
              text "📕 英文必選修課程", size: "sm", offsetStart: "xl", flex: 4
              text "4學分", size: "sm", align: "end"
            end
          end
        end
      end
      footer do
        separator color: "#cccccc"
        text "備註：", margin: "md"
        text "📌 英文課抵免請點這邊", size: "sm", offsetStart: "xl", margin: "md", decoration: "underline", action: uri_action("https://cle-r.ntust.edu.tw/p/412-1070-8971.php?Lang=zh-tw"), color: "#0645AD"
      end
    end
  end

  def common_credit_general_education
    bubble do
      body do
        vertical_box do
          text "課程內容", weight: "bold", color: "#1DB446", size: "sm"
          text "通識課程", weight: "bold", size: "xxl", margin: "md"
          text "15 學分", size: "xs", color: "#aaaaaa", wrap: true
          vertical_box margin: "xxl", spacing: "sm" do
            separator color: "#cccccc"
            text "下列為通識課程的向度：", margin: "md"
            text "📕 人文素養（A 向度）", size: "sm", offsetStart: "xl", margin: "md"
            text "📕 當代文明（B 向度）", size: "sm", offsetStart: "xl", margin: "md"
            text "📕 美感與人生探索（C 向度）", size: "sm", offsetStart: "xl", margin: "md"
            text "📕 社會與歷史文化（D 向度）", size: "sm", offsetStart: "xl", margin: "md"
            text "📕 群己與制度發展（E 向度）", size: "sm", offsetStart: "xl", margin: "md"
            text "📕 自然與生命科學（F 向度）", size: "sm", offsetStart: "xl", margin: "md"
          end
        end
      end
      footer do
        separator color: "#cccccc"
        text "備註：", margin: "md"
        text "📌 需修滿 15 個通識學分，包含四種向度", size: "sm", offsetStart: "xl", margin: "md", wrap: true
      end
    end
  end

  def common_credit_social_service
    bubble do
      body do
        vertical_box do
          text "課程內容", weight: "bold", color: "#1DB446", size: "sm"
          text "社會實踐", weight: "bold", size: "xxl", margin: "md"
          text "1 學分", size: "xs", color: "#aaaaaa", wrap: true
          vertical_box margin: "xxl", spacing: "sm" do
            separator color: "#cccccc"
            text "下列為社會實踐的重點：", margin: "md"
            text "📌 1 學分必修（沒修完不能畢業）", size: "sm", offsetStart: "xl", margin: "md"
            text "📌 主要理念為服務社會", size: "sm", offsetStart: "xl", margin: "md"
            text "📌 部分社團會舉辦社會實踐營隊", size: "sm", offsetStart: "xl", margin: "md"
            text "📌 需要寫計畫並且尋找指導老師", size: "sm", offsetStart: "xl", margin: "md"
          end
        end
      end
      footer do
        separator color: "#cccccc"
        text "備註：", margin: "md"
        text "📌 社會實踐詳細規定請點這邊", size: "sm", offsetStart: "xl", margin: "md", decoration: "underline", action: uri_action("https://cla.ntust.edu.tw/p/412-1076-8604.php?Lang=zh-tw"), color: "#0645AD"
      end
    end
  end

  def common_credit_physical_education
    bubble do
      body do
        vertical_box do
          text "課程內容", weight: "bold", color: "#1DB446", size: "sm"
          text "體育", weight: "bold", size: "xxl", margin: "md"
          text "0 學分", size: "xs", color: "#aaaaaa", wrap: true
          vertical_box margin: "xxl", spacing: "sm" do
            separator color: "#cccccc"
            text "下列為體育課的種類：", margin: "md"
            horizontal_box do
              text "📕 校隊", size: "sm", offsetStart: "xl"
              text "📕 籃球", size: "sm", offsetStart: "xl"
              text "📕 排球", size: "sm", offsetStart: "xl"
            end
            horizontal_box do
              text "📕 桌球", size: "sm", offsetStart: "xl"
              text "📕 網球", size: "sm", offsetStart: "xl"
              text "📕 羽球", size: "sm", offsetStart: "xl"
            end
            horizontal_box do
              text "📕 游泳", size: "sm", offsetStart: "xl"
              text "📕 木球", size: "sm", offsetStart: "xl"
              text "📕 撞球", size: "sm", offsetStart: "xl"
            end
            horizontal_box do
              text "📕 足球", size: "sm", offsetStart: "xl"
              text "📕 棒壘球", size: "sm", offsetStart: "xl"
              text "📕 高爾夫", size: "sm", offsetStart: "xl"
            end
            horizontal_box do
              text "📕 法式滾球", size: "sm", offsetStart: "xl"
              text "📕 流行舞蹈", size: "sm", offsetStart: "xl"
              text "📕 重訓", size: "sm", offsetStart: "xl"
            end
            horizontal_box do
              text "📕 健行登山", size: "sm", offsetStart: "xl"
              text "📕 瑜珈", size: "sm", offsetStart: "xl"
              text " ", size: "sm", offsetStart: "xl"
            end
          end
        end
      end
      footer do
        separator color: "#cccccc"
        text "備註：", margin: "md"
        text "📌 關於各體育課教學內容可以點這邊", size: "sm", offsetStart: "xl", margin: "md", decoration: "underline", action: uri_action("https://www.sport.ntust.edu.tw/p/412-1069-8783.php?Lang=zh-tw"), color: "#0645AD"
      end
    end
  end
end
