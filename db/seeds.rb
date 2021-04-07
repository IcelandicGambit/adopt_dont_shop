# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PetApplication.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all
VeterinaryOffice.destroy_all
Veterinarian.destroy_all


shelter_1 = Shelter.create!(name: 'Portland Animal Rescue', city: 'Portland, OR', foster_program: true, rank: 1)
shelter_2 = Shelter.create(name: 'Aurora Shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

pet_1 = Pet.create(adoptable: true, age: 1, breed: 'Russian Blue', name: 'Cowboy', shelter_id: shelter_1.id)
pet_2 = Pet.create(adoptable: true, age: 1, breed: 'Sphynx', name: 'Ceri', shelter_id: shelter_1.id)
pet_3 = Pet.create(adoptable: true, age: 3, breed: 'Doberman', name: 'Carwyn', shelter_id: shelter_2.id)
pet_4 = Pet.create(adoptable: true, age: 15, breed: 'Chow Golden Retriever mix', name: 'Zeus', shelter_id: shelter_2.id)
pet_5 = Pet.create(adoptable: true, age: 1, breed: 'Unknown', name: 'White Monster Ultra', shelter_id: shelter_1.id)
pet_6 = Pet.create(adoptable: true, age: 4, breed: 'French Bulldog', name: 'George', shelter_id: shelter_1.id)
pet_7 = Pet.create(adoptable: true, age: 6, breed: 'Yellow Lab', name: 'Tug Boat', shelter_id: shelter_2.id)
pet_8 = Pet.create(adoptable: true, age: 5, breed: 'Pixie Bob', name: 'Mercy', shelter_id: shelter_1.id)
pet_9 = Pet.create(adoptable: true, age: 3, breed: 'Greyhound', name: 'Gwion', shelter_id: shelter_1.id)
pet_10 = Pet.create(adoptable: true, age: 5, breed: 'Maine Coon', name: 'Llewellyn', shelter_id: shelter_2.id)
pet_11 = Pet.create(adoptable: true, age: 7, breed: 'Tabby', name: 'Siobhan', shelter_id: shelter_2.id)

application_1 = Application.create!(name: "Yasser Seirawan", address: "742 Evergreen Terrace", city: "Springfield", state: "OR", zip_code: 97205, description: "Looking for a lockdown companion", status: "In progress")
application_2 = Application.create!(name: "Bent Larsen", address: "1138 Memory Lane", city: "Aurora", state: "CO", zip_code: 20165, description: "I want to adopt one new cat every year", status: "In progress")
PetApplication.create!(application: application_1, pet: pet_1)
PetApplication.create!(application: application_2, pet: pet_2)

vet_1 = VeterinaryOffice.create!(name: 'Frontier Veterinary Clinic', boarding_services: true, max_patient_capacity: 30)
vet_2 = VeterinaryOffice.create!(name: 'Country Vet', boarding_services: true, max_patient_capacity: 15)

vet_1.veterinarians.create!(name: 'Adam', review_rating: 10, on_call: true)
vet_1.veterinarians.create!(name: 'Matt', review_rating: 7, on_call: true)
vet_1.veterinarians.create!(name: 'Kevin', review_rating: 10, on_call: true)
vet_1.veterinarians.create!(name: 'Janet', review_rating: 8, on_call: false)

vet_2.veterinarians.create!(name: 'Dylan', review_rating: 5, on_call: false)
vet_2.veterinarians.create!(name: 'Rhys', review_rating: 4, on_call: true)





