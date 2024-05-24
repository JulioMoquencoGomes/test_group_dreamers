class TouristSpotController < ApplicationController

    def index
        name = params[:name] || ""
        all_registered = ::Service::OpenTripMap::TouristSpot.new(name).register
        render :json => { "success": all_registered }
    end

end