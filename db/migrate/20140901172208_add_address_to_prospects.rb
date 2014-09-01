class AddAddressToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :street, :string
    add_column :prospects, :citystatezip, :string
  end
end
