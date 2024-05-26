class TouristSpot < ApplicationRecord
    self.table_name = "touristspots"
    validates :name, :city, :state, :country, :xid, :description, :coordenates,  presence: true

    def self.looking_for_some_reference(reference)
        where("name LIKE :name or city LIKE :city or state LIKE :state or country LIKE :country or kinds LIKE :kinds", 
        {
            :name       => "%#{reference}%",
            :city       => "%#{reference}%",
            :state      => "%#{reference}%",
            :country    => "%#{reference}%",
            :kinds      => "%#{reference}%" 
        })
    end
end