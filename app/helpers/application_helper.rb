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

  def menu(title, backgroundColor = "#FF0000")
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
end
