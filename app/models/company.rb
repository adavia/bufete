class Company < ApplicationRecord
  has_many :clients

  validates :name, presence: true
end
