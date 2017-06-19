class PagesController < ApplicationController
  def deciduous
    
  end
  
  def evergreen
    
  end
  
  def herbacious
    
  end
    
  def home
    @plants            = Plant.all
    @deciduous_plants  = Plant.deciduous
    @evergreen_plants  = Plant.evergreen
    @herbacious_plants = Plant.herbacious
    
    @carousel_images   = Overview.active.where(carousel: true)
    
    @deciduous_cover   = Overview.find_by(name: 'deciduous')
    @evergreen_cover   = Overview.find_by(name: 'evergreen')
    @herbacious_cover  = Overview.find_by(name: 'herbacious')
  end
end
  