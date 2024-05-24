module Service
    module OpenTripMap
        class TouristSpot

            def initialize(name)
                @name = name
            end

            def coordenates
                ::Service::OpenTripMap::Request::PlaceName.new(@name).get
            end

            def features(coordenates)
                response = ::Service::OpenTripMap::Request::Bbox.new(
                    coordenates['lat'], coordenates['lon']
                ).get unless coordenates == nil
                return response['features'] if response['features'].count > 0
                nil
            end

            def search                
                features(coordenates).each do |feature|
                    xid = feature['properties']['xid'].to_s
                    response_xid = ::Service::OpenTripMap::Request::Xid.new(xid).get
                    feature["response_xid"] = response_xid
                end
            end
        end
    end
end