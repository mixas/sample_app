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
end
