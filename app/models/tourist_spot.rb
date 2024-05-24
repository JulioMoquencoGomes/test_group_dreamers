class TouristSpot
    include ActiveModel::ApplicationController
    attr_accessor :name, :city, :state, :country, :xid, :kinds, :image, :url, :description, :coordenates
end