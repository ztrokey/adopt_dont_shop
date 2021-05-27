class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_alphabetical
    @shelters_pending = Shelter.pending_applications
  end
end