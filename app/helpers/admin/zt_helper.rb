module Admin::ZtHelper
  # Sorts array of objects by the Attribute (if passed)
  def sort_objects objects_array, attribute=nil
    if attribute.nil?
      objects_array
    else
      objects_array.sort! { |a,b| eval("a.#{attribute} <=> b.#{attribute}") }
    end
  end

  # Selects a status mark to be displayed
  def status_mark status
    if status == 'active' || status == true
      image_tag('admin/checkmark.png', size: '12x15', alt: 'Active')
    else
      image_tag('admin/archive.png',   size: '12x15', alt: 'Archive')
    end
  end
  
  # Sets a range of years (when plants were sticked in)
  def years_range
    years = []
    for year in 2005..Time.now.year do
      years << year
    end
    years
  end
end
