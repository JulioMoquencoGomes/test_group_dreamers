class TouristSpotController < ApplicationController

    def index
        begin
            name = params[:name] || ""
            all_registered = ::Service::OpenTripMap::TouristSpot.search_and_register(name)
            render :json => { "success": all_registered }
        rescue
            render :json => { "success": false }
        end
    end

    def result
        begin
            lang = params[:lang] || "en"
            places = TouristSpot.all
            encodeds = ::Service::OpenTripMap::TouristSpot.encoding_to_utf8(places)
            encodeds.each do |encoded|
                encoded[:translate] = ::Service::RapidApi::RapidApi.new(encoded, lang).info_translate
            end
            render :json => encodeds
        rescue
            render :json => { "success": false }
        end
    end
end