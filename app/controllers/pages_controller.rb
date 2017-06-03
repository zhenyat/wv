class PagesController < ApplicationController
  def home
    @plants             = Plant.all
    @decidious_plants   = Plant.decidious
    @evergreen_plants   = Plant.evergreen
    @herbacious_plants  = Plant.herbacious
  end
end
  