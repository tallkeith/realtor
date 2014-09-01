class AddLatLngToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :latitude, :decimal
    add_column :prospects, :longitude, :decimal
  end
end
