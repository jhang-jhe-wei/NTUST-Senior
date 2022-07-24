class AddSchoolToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :school, :string
  end
end
