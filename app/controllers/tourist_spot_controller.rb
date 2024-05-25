class TouristSpotController < ApplicationController

    def index
        name = params[:name] || ""
        all_registered = ::Service::OpenTripMap::TouristSpot.search_and_register(name)
        render :json => { "success": all_registered }
    end

    def result
        lang = params[:lang] || "en"
        places = TouristSpot.all
        encodeds = ::Service::OpenTripMap::TouristSpot.encoding_to_utf8(places)
        encodeds.each do |encoded|
            encoded[:translate] = ::Service::RapidApi::RapidApi.new(encoded, lang).info_translate
        end
        render :json => encodeds
    end
end