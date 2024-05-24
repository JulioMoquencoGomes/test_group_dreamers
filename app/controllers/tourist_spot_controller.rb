class TouristSpotController < ApplicationController

    def index
        name = params[:name] || ""
        coordenates = ::Service::OpenTripMap::Request::PlaceName.new(name).get
        
        response_features = ::Service::OpenTripMap::Request::Bbox.new(
            coordenates['lat'], coordenates['lon']
        ).get unless coordenates == nil
        
        featureCollection = response_features['features']
        featureCollectionCount = featureCollection.count

        featureCollection.each do |feature|
            xid = feature['properties']['xid'].to_s
            response_xid = ::Service::OpenTripMap::Request::Xid.new(xid).get
            feature["response_xid"] = response_xid
        end

        render :json => featureCollection
    end

end