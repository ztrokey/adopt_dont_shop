# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.destroy_all
Shelter.destroy_all

shelter_3 = Shelter.create!(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
shelter_1 = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
shelter_2 = Shelter.create!(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
pet_1 = shelter_1.pets.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
pet_2 = shelter_2.pets.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
pet_3 = shelter_3.pets.create!(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
application_1 = Application.create!(name: 'Chris P. Bacon', street_address: '123 Main Street', city: 'Anytown', state: 'CO', zip_code: 12345, description: 'I like pets', status: 'Pending')
application_2 = Application.create!(name: "May O'Nays", street_address: '654 1st Street', city: 'Yourtown', state: 'AZ', zip_code: 54321, description: 'I like pets more', status: 'Pending')
application_3 = Application.create!(name: 'Phillip DaForm', street_address: '789 21st Ave', city: 'Mytown', state: 'NY', zip_code: 98765, description: 'I like pets the most', status: 'Approved')
application_1.pets << pet_1
application_2.pets << pet_2
application_3.pets << pet_3