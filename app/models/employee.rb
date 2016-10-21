class Employee < ApplicationRecord
  belongs_to :client

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments

  validates :name, presence: true
  validates :last_name, presence: true
  validates :ife, presence: true

  def to_s
    "#{name} #{last_name}"
  end
end
