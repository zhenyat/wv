class PagesController < ApplicationController
  def deciduous
    @deciduous_plants  = Plant.deciduous
  end

  def evergreen
    @evergreen_plants  = Plant.evergreen
  end
  
  def herbacious
    @herbacious_plants = Plant.herbacious
  end
  
  def home
    @article = Article.first
    
    @plants            = Plant.all
    @deciduous_plants  = Plant.deciduous
    @evergreen_plants  = Plant.evergreen
    @herbacious_plants = Plant.herbacious
    
    @carousel_images   = Overview.active.where(carousel: true)
    
    @deciduous_cover   = Overview.find_by(name: 'deciduous')
    @evergreen_cover   = Overview.find_by(name: 'evergreen')
    @herbacious_cover  = Overview.find_by(name: 'herbacious')
  end
  
  def pictures
    @plant    = Plant.find(params[:plant_id])
    puts @plant.inspect
    @pictures = @plant.pictures
  end
end
  