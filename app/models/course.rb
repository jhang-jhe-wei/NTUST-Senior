class Course < ApplicationRecord
  has_many :user_and_course_records, dependent: :destroy
  has_many :course_times, dependent: :destroy
  has_many :users, through: :user_and_course_records
  scope :mon, -> { joins(:course_times).where("section LIKE ?", "週一%").pluck(:name,:section) }
  scope :thus, -> { joins(:course_times).where("section LIKE ?", "週二%").pluck(:name,:section) }
  scope :wed, -> { joins(:course_times).where("section LIKE ?", "週三%").pluck(:name,:section) }
  scope :thur, -> { joins(:course_times).where("section LIKE ?", "週四%").pluck(:name,:section) }
  scope :fri, -> { joins(:course_times).where("section LIKE ?", "週五%").pluck(:name,:section) }
  scope :sat, -> { joins(:course_times).where("section LIKE ?", "週六%").pluck(:name,:section) }
  scope :sun, -> { joins(:course_times).where("section LIKE ?", "週日%").pluck(:name,:section) }
end
