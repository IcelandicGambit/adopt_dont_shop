class AdminController < ApplicationController
  def shelters
    @shelters = Shelter.find_all_reversed
    @pending_shelter_apps = Shelter.pending_shelter_apps
  end
end
