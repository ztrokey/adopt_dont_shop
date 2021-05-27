require 'rails_helper'

RSpec.describe 'the admin/shelters index' do
  before(:each) do
    @shelter_3 = Shelter.create!(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
    @shelter_1 = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create!(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @pet_1 = @shelter_1.pets.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @pet_2 = @shelter_2.pets.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_3.pets.create!(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    @application_1 = Application.create!(name: 'Chris P. Bacon', street_address: '123 Main Street', city: 'Anytown', state: 'CO', zip_code: 12345, description: 'I like pets', status: 'Pending')
    @application_2 = Application.create!(name: "May O'Nays", street_address: '654 1st Street', city: 'Yourtown', state: 'AZ', zip_code: 54321, description: 'I like pets more', status: 'Pending')
    @application_3 = Application.create!(name: 'Phillip DaForm', street_address: '789 21st Ave', city: 'Mytown', state: 'NY', zip_code: 98765, description: 'I like pets the most', status: 'Approved')
    @application_1.pets << @pet_1
    @application_2.pets << @pet_2
    @application_3.pets << @pet_3
  end

  it 'lists all the shelters in reverse alphabetical order' do
    visit '/admin/shelters'

    expect(@shelter_2.name).to appear_before(@shelter_3.name)
    expect(@shelter_2.name).to appear_before(@shelter_1.name)
    expect(@shelter_3.name).to appear_before(@shelter_1.name)
  end

  it 'has lists all the shelters with pending applications in the pending section' do

    visit '/admin/shelters'

    within('#pending_applications') do
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)
      expect(page).to_not have_content(@shelter_3.name)
    end
  end
end