class Shelter < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true, numericality: true
  validates :city, presence: true

  has_many :pets, dependent: :destroy

  def self.order_by_recently_created
    order(created_at: :desc)
  end

  def self.order_by_number_of_pets
    select("shelters.*, count(pets.id) AS pets_count")
      .joins("LEFT OUTER JOIN pets ON pets.shelter_id = shelters.id")
      .group("shelters.id")
      .order("pets_count DESC")
  end

  def pet_count
    pets.count
  end

  def adoptable_pets
    pets.where(adoptable: true)
  end

  def alphabetical_pets
    adoptable_pets.order(name: :asc)
  end

  def shelter_pets_filtered_by_age(age_filter)
    adoptable_pets.where('age >= ?', age_filter)
  end

  def self.find_all_reversed
    select("shelters.*")
      .order("name DESC")
  end

  def self.pending_shelter_apps
    select("shelters.*")
    .joins("INNER JOIN pets ON shelters.id = pets.shelter_id")
    .joins("INNER JOIN pet_applications ON pets.id = pet_applications.pet_id")
    .joins("INNER JOIN applications ON pet_applications.application_id = applications.id")
    .where("applications.status = 'Pending'")
  end
end
