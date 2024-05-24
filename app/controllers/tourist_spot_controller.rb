class TouristSpotController < ApplicationController

    def index
        name = params[:name] || ""
        featureCollection = ::Service::OpenTripMap::TouristSpot.new(name).search
        render :json => featureCollection
    end

end