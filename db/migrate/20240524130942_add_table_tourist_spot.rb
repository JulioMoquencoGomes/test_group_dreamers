class AddTableTouristSpot < ActiveRecord::Migration[7.1]
  def change
    create_table :touristspots do |t|
      t.string :name
      t.string :city, :limit => 50
      t.string :state, :limit => 50
      t.string :country, :limit => 50
      t.string :xid, :limit => 50
      t.string :kinds
      t.string :image
      t.string :url
      t.string :description, :limit => 2000
      t.string :coordenates, :limit => 255

      t.timestamps
    end
  end
end
