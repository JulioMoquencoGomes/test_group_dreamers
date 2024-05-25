class TouristSpot < ApplicationRecord
    self.table_name = "touristspots"
    validates :name, :city, :state, :country, :xid, :description, :coordenates,  presence: true
end