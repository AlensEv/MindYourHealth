class Symptom < ApplicationRecord
  validates :name, presence: true
  validates :Age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :Gender, inclusion: { in: %w(Male Female Other), message: "%{value} is not a valid gender" }

end
