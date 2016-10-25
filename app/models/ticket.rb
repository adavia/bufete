class Ticket < ApplicationRecord
  belongs_to :employee
  belongs_to :user

  validates :name, presence: true
end
