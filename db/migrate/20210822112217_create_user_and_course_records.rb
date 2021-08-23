class CreateUserAndCourseRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :user_and_course_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
