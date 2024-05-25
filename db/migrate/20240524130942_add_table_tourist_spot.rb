class AddTableTouristSpot < ActiveRecord::Migration[7.1]
  def change
    create_table :touristspots, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name, :limit=> 150, :null => false
      t.string :city, :limit => 50, :null => false
      t.string :state, :limit => 50, :null => false
      t.string :country, :limit => 50, :null => false
      t.string :xid, :limit => 50, :null => false
      t.string :kinds
      t.string :image
      t.string :url
      t.string :description, :limit => 2000, :null => false
      t.string :coordenates, :limit => 255, :null => false

      t.timestamps
    end
  end
end
