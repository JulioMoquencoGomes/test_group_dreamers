class AddTableTouristSpot < ActiveRecord::Migration[7.1]
  def change
    create_table :touristspots do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :xid
      t.string :kinds
      t.string :image
      t.string :url
      t.string :description
      t.string :coordenates

      t.timestamps
    end
  end
end
