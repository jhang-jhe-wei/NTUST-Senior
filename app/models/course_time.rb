class CourseTime < ApplicationRecord
  belongs_to :course
  scope :mon, -> { where("section LIKE ?", "週一%") }
  scope :thus, -> { where("section LIKE ?", "週二%") }
  scope :wed, -> { where("section LIKE ?", "週三%") }
  scope :thur, -> { where("section LIKE ?", "週四%") }
  scope :fri, -> { where("section LIKE ?", "週五%") }
  scope :sat, -> { where("section LIKE ?", "週六%") }
  scope :sun, -> { where("section LIKE ?", "週日%") }
end
