namespace :dev do
  desc "get place id by place name"
  task get_place_id_by_name: :environment do
    Place.where(place_id: nil).each do |place|
      place.update(place_id: Google::Maps.places(place.name).first.place_id)
    end
  end
end
