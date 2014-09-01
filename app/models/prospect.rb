class Prospect < ActiveRecord::Base

	geocoded_by :address
	after_validation :geocode

  def address
    "#{street} #{citystatezip}"
  end
	
end
