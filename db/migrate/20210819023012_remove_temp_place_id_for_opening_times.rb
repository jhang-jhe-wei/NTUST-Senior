class RemoveTempPlaceIdForOpeningTimes < ActiveRecord::Migration[6.1]
  def up
    remove_column :opening_times, :int_place_id
    rename_column :opening_times, :string_place_id, :place_id
  end

  def down
    rename_column :opening_times, :place_id, :string_place_id
    add_column :opening_times, :int_place_id, :integer

    OpeningTime.all.each do |opening_time|
      place = Place.find_by(place_id: opening_time.string_place_id)
      opening_time.update!(int_place_id: place.id)
    end
  end
end


# 加 new column 的 migration
# deploy (1)
# 跑 migration
# 跑 one time task 生成 new data



# 加程式碼 rails 使用 new data
# deploy (2) （確定運作正常）



# 加移除 old column 的 migration
# deploy (3)
# 跑 migration

