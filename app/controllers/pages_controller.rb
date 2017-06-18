class PagesController < ApplicationController
  def home
    @plants             = Plant.all
    @decidious_plants   = Plant.decidious
    @evergreen_plants   = Plant.evergreen
    @herbacious_plants  = Plant.herbacious
    
    @carousel_images    = Overview.active.where(carousel: true)
  end
end
  