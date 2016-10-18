class Employee < ApplicationRecord
  belongs_to :client

  def to_s
    "#{name} #{last_name}"
  end
end
