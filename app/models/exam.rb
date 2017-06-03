class Exam < ApplicationRecord
  has_many :questions , dependent: :destroy
  has_many :respondents, dependent: :destroy

  validates :title, length: {within: 1..100}, presence: true
  validates :description, length: {with: 1..100}, presence: true

end
