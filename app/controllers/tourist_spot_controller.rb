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
                encoded[:translate][:name]          = ::Service::RapidApi::RapidApi.translate(encoded["name"], lang)
                encoded[:translate][:description]   = ::Service::RapidApi::RapidApi.translate(encoded["descrition"], lang)
            end
            render :json => { "success": true, "response": encodeds }
        rescue
            render :json => { "success": false }
        end
    end
end