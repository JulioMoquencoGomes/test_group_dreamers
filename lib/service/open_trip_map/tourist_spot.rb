module Service
    module OpenTripMap
        class TouristSpot

            def self.coordenates(name)
                ::Service::OpenTripMap::Request::PlaceName.new(name).get
            end

            def self.features(coordenates)
                response = ::Service::OpenTripMap::Request::Bbox.new(
                    coordenates['lat'], coordenates['lon']
                ).get unless coordenates == nil
                return response['features'] if response['features'].count > 0
                nil
            end

            def self.save_register_to_database(response_xid)
                model = ::TouristSpot.new(name: response_xid['name']
                xid: response_xid['xid'],
                city: response_xid['address']['city'],
                state: response_xid['address']['state'],
                country: response_xid['address']['country'],
                kinds: response_xid['kinds'],
                image: response_xid['image'],
                url: response_xid['url'],
                description: response_xid['wikipedia_extracts']['text'],
                coordenates: "lat: #{response_xid['point']['lat']}, lon: #{response_xid['point']['lon']}")
                model.save
            end

            def self.search_and_register(name)
                return false if name == nil
                begin            
                    features(coordenates(name)).each do |feature|
                        xid = feature['properties']['xid'].to_s
                        response_xid = ::Service::OpenTripMap::Request::Xid.new(xid).get
                        save_register_to_database(response_xid)
                    end
                    true
                rescue
                    false
                end
            end

            def self.encoding_to_utf8(places_founded)
                return false if places_founded == nil
                new_places_founded = []
                places_founded.each do |place|
                    new_places_founded.push({
                        "name" => place.name.force_encoding('UTF-8'),
                        "xid" => place.xid.force_encoding('UTF-8'),
                        "city" => place.city.force_encoding('UTF-8'),
                        "state" => place.state.force_encoding('UTF-8'),
                        "country" => place.country.force_encoding('UTF-8'),
                        "kinds" => place.kinds.force_encoding('UTF-8'),
                        "image" => place.image,
                        "url" => place.url,
                        "description" => place.description.force_encoding('UTF-8'),
                        "coordenates" => place.coordenates.force_encoding('UTF-8')
                    })
                end
                new_places_founded
            end

        end
    end
end