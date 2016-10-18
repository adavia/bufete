class Client < ApplicationRecord
  belongs_to :company
  has_many :employees

  validates :name, presence: true
end
