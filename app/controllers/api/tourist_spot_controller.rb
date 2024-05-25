
class Api::TouristSpotController < ApplicationController
    def index
        begin
            name = params[:name] || ""
            lang = params[:lang] || "en"

            all_registered = ::Service::OpenTripMap::TouristSpot.search(name, lang)
            render :json => { "success": true, "response": all_registered }
        rescue
            render :json => { "success": false }
        end
    end
end