class Passenger < ApplicationRecord
  validates :name, presence: true
  belongs_to :booking  
end
