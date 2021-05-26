class Admin::SheltersController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @shelters = Shelter.reverse_alphabetical
  end
end