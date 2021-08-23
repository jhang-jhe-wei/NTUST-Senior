class CreateCourseTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :course_times do |t|
      t.string :section
      t.references :course
      
      t.timestamps
    end
  end
end
