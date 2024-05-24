class TouristSpotController < ApplicationController

    def index
        name = params[:name] || ""
        register = ::Service::OpenTripMap::TouristSpot.new(name).register
        render :json => { "success": register }
    end

end