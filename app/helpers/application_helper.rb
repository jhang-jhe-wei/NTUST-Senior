module ApplicationHelper
  def pagenator(resource_name, resources, backgroundColor: "#00CE39")
    bubble do
      header margin: "none", backgroundColor: backgroundColor do
        vertical_box do
          text "功能頁",gravity: "center",size: "xl",align: "center",color: "#FFFFFF"
        end
      end
      body margin: "none" do
        unless resources.first_page?
          message_button "第一頁", "#{resource_name}/1", style: "secondary", margin: "md"
          message_button "上一頁", "#{resource_name}/#{resources.prev_page}", style: "secondary", margin: "md"
        end
        unless resources.blank? || resources.last_page?
        message_button "下一頁", "#{resource_name}/#{resources.next_page}", style: "secondary", margin: "md"
        message_button "最後一頁", "#{resource_name}/#{resources.total_pages}", style: "secondary", margin: "md"
        end

        yield if block_given?
      end
      footer do
        text "目前在 #{@current_page}/#{[resources.total_pages, 1].max} 頁", align: "center"
      end
    end
  end

  def image_flex(*image_urls, **options)
    image_urls = image_urls.flatten
    Kamiflex.hash(self) do
      carousel do
        bubbles image_urls, size: :giga do |image_url|
          body paddingAll: "0px" do
            image image_url, {size: :full, aspectRatio: "1764:1106", aspectMode: :fit, action: uri_action(image_url)}.merge(options)
          end
        end
      end
    end
  end

  def menu(title, backgroundColor = "#FEB9EF")
    bubble size: "kilo" do
      header backgroundColor: backgroundColor do
        vertical_box do
          text title, gravity: "center", size: "xl", align: "center", color: "#FFFFFF"
        end
      end
      body margin: "none" do
          yield
      end
      footer do
        filler
      end
    end
  end

  def menu_text_item(text, **options)
    message_button text, text, {style: "secondary", margin: "md", height: "sm", adjustMode: "shrink-to-fit", color: "#eeeeee"}.merge(options)
  end

  def menu_uri_item(label, url, **options)
    url_button label, url, {style: "secondary", margin: "md", height: "sm", adjustMode: "shrink-to-fit", color: "#eeeeee"}.merge(options)
  end

  def rich_menu
    {
    "type": "imagemap",
    "baseUrl": image_url("rich-menu"),
    "altText": "This is an imagemap",
    "baseSize": {
        "width": 1040,
        "height": 700
    },
    "actions": [{
            "type": "message",
            "text": "新生引導",
            "area": {
                "x": 0,
                "y": 0,
                "width": 520,
                "height": 350
            }
        },
        {
            "type": "message",
            "text": "我想請問",
            "area": {
                "x": 520,
                "y": 0,
                "width": 520,
                "height": 350
            }
        },
        {
            "type": "message",
            "text": "訂閱通知",
            "area": {
                "x": 0,
                "y": 350,
                "width": 520,
                "height": 350
            }
        },
        {
            "type": "uri",
            "linkUri": "https://liff.line.me/1656022412-QDyzYN5j/eyJwYXRoIjoiL2ZlZWRiYWNrcy9uZXciLCJsaWZmX3NpemUiOiJUQUxMIn0",
            "area": {
                "x": 520,
                "y": 350,
                "width": 520,
                "height": 350
            }
        }
    ]
}
  end

  def image_url(image_name)
    "https://wells.tw/NTUST-Senior/docs/#{image_name}"
  end
end
