class AddPlaceToCourseTimes < ActiveRecord::Migration[6.1]
  def change
    add_column :course_times, :place, :string
  end
end
