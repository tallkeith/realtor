class Prospect < ActiveRecord::Base

	geocoded_by :address
	after_validation :geocode

	validates_format_of :email, :with => /@/, :message => "Please enter a valid email address"
	validates_presence_of :name
	validates_length_of :phone, :minimum => 10

  def address
    "#{street} #{citystatezip}"
  end
	
end
