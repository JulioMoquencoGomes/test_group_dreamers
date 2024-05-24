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

            def save_register_to_database(response_xid)
                tourist_spot = TouristSpot.new(
                    name: response_xid['name'], xid: response_xid['xid'],
                    city: response_xid['address']['city'], state: response_xid['address']['state'],
                    country: response_xid['address']['country'], kinds: response_xid['kinds'],
                    image: response_xid['image'], url: response_xid['url'],
                    description: response_xid['wikipedia_extracts']['text'],
                    coordenates: "lat: #{response_xid['point']['lat']}, lon: #{response_xid['point']['lon']}")
                tourist_spot.save
            end

            def register
                begin            
                    features = features(coordenates).each do |feature|
                        #xid = feature['properties']['xid'].to_s
                        #response_xid = ::Service::OpenTripMap::Request::Xid.new(xid).get
                    end
                    xid = features[0]['properties']['xid'].to_s
                    response_xid = ::Service::OpenTripMap::Request::Xid.new(xid).get
                    save_register_to_database(response_xid)
                    true
                rescue
                    false
                end
            end
        end
    end
end