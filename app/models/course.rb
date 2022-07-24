class Course < ApplicationRecord
  has_many :user_and_course_records, dependent: :destroy
  has_many :course_times, dependent: :destroy
  has_many :users, through: :user_and_course_records
end
