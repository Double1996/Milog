class Question < ApplicationRecord
  belongs_to :exam
  has_many :response_options, dependent: :destroy
  accepts_nested_attributes_for :response_options,
                                :reject_if => :all_blank,
                                :allow_destroy => true

  validates :text, length: { within: 1..200 }, allow_nil: true

  def self.question_types
    [
      ["单选题", "multi"],
      ["论述题", "essay"],
      ["填空题", "filling"]
    ]
  end

  def required?
    self.require
  end

  def require_status
    self.required ?  "Required" : "Not Required"
  end
end
