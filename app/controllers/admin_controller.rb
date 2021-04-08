class AdminController < ApplicationController
  def shelter
    @shelters = Shelter.find_all_reversed
  end
end
