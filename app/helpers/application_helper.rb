module ApplicationHelper
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
    "baseUrl": "https://blog.wells.tw/NTUST-Senior/richmenu",
    "altText": "This is an imagemap",
    "baseSize": {
        "width": 1040,
        "height": 351
    },
    "actions": [{
            "type": "message",
            "text": "新生引導",
            "area": {
                "x": 0,
                "y": 0,
                "width": 346,
                "height": 351
            }
        },
        {
            "type": "message",
            "text": "我想請問",
            "area": {
                "x": 346,
                "y": 0,
                "width": 346,
                "height": 351
            }
        },
        {
            "type": "uri",
            "linkUri": "https://liff.line.me/1656022412-QDyzYN5j/eyJwYXRoIjoiL2ZlZWRiYWNrcy9uZXciLCJsaWZmX3NpemUiOiJUQUxMIn0",
            "area": {
                "x": 692,
                "y": 0,
                "width": 346,
                "height": 351
            }
        }
    ]
}
  end
end
