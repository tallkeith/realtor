class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :reason

      t.timestamps
    end
  end
end
