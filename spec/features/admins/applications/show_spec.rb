require 'rails_helper'

RSpec.describe 'the admin show page' do
  before(:each) do
    @shelter_1 = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

    @pet_1 = @shelter_1.pets.create!(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @pet_2 = @shelter_1.pets.create!(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_1.pets.create!(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)

    @application_1 = Application.create!(name: 'Chris P. Bacon', street_address: '123 Main Street', city: 'Anytown', state: 'CO', zip_code: 12345, description: 'I like pets', status: 'Pending')
    @application_2 = Application.create!(name: 'Phillip DaForm', street_address: '789 21st Ave', city: 'Mytown', state: 'NY', zip_code: 98765, description: 'I like pets the most', status: 'Approved')

    @application_1.pets << @pet_1
    @application_1.pets << @pet_2
    @application_1.pets << @pet_3

    @application_2.pets << @pet_1
    @application_2.pets << @pet_2
    @application_2.pets << @pet_3
  end

  it 'can approve a pet for an application' do
    visit "/admin/applications/#{@application_1.id}"

    within("#pet-#{@pet_1.id}") {click_button 'Approve'}

    within("#application-#{@application_1.id}") do
      expect(page).to have_content('Application Status: Approved')
    end
  end

  it 'can reject a pet for an application' do
    visit "/admin/applications/#{@application_1.id}"

    within("#pet-#{@pet_1.id}") {click_button 'Reject'}

    within("#application-#{@application_1.id}") do
      expect(page).to have_content('Application Status: Rejected')
    end
  end
end