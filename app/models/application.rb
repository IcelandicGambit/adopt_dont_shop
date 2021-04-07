class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true, allow_nil: true

  def set_in_progress
    self.status = "In Progress" 
  end

  def set_pending
    self.status = "Pending"
  end
end
