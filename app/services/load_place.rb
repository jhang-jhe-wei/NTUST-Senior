class LoadPlace
  def initialize(name)
    @google_map_result = Google::Maps.place(Google::Maps.places(name).first.place_id)
  end

  def perform
    photo_url = Faraday.get("https://maps.googleapis.com/maps/api/place/photo",
                            maxwidth: 400,
                            photoreference: @google_map_result.data.photos.first.photo_reference,
                            key: ENV["GOOGLE_API_KEY"]).headers["location"]
    place = Place.find_or_create_by(name: @google_map_result.data.name)
    opening_times = @google_map_result.data.opening_hours.weekday_text.map do |section|
      OpeningTime.create(section: section)
    end
    place.update!(
      photo: photo_url,
      name: @google_map_result.data.name,
      star: @google_map_result.data.rating,
      address: @google_map_result.data.formatted_address,
      opening_times: opening_times,
      google_map_url: @google_map_result.data.url,
    )
  end
end
