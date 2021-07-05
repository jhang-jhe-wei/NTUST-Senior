module ApplicationHelper
  def image_flex(*image_urls, **option)
    image_urls = image_urls.flatten
    Kamiflex.hash(self) do
      carousel do
        bubbles image_urls, size: :giga do |image_url|
          body paddingAll: "0px" do
            image image_url, {size: :full, aspectRatio: "1764:1106", aspectMode: :fit, action: uri_action(image_url)}.merge(option)
          end
        end
      end
    end
  end
end
