class Client < ApplicationRecord
  belongs_to :company
  has_many :employees

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments

  validates :name, presence: true
end
