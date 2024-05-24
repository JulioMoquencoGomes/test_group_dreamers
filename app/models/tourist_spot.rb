class TouristSpot < ApplicationRecord
    self.table_name = "touristspots"
    attr_accessor :name, :city, :state, :country, :xid, :kinds, :image, :url, :description, :coordenates
end