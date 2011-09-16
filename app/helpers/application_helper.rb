module ApplicationHelper
  
  #return base title if title is nil
  def title
    base_title = "Ruby on rails tutorial Sample app"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("rails.png", :alt => "Sample App", :class => "round")
  end

end
