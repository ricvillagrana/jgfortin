class CallbackRequest < ApplicationRecord
  belongs_to :homeowner_insurance

  validates :phone, presence: true

  enum best_moment: [
    'AM',
    'Between 11AM and 1PM',
    'PM',
    'Between 4PM and 6:30PM'
  ]

  serialize :reasons, Array
end
