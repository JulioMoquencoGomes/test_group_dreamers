require 'pry'
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
                model = ::TouristSpot.new
                model[:name] = response_xid['name']
                model[:xid] = response_xid['xid']
                model[:city] = response_xid['address']['city'] 
                model[:state] = response_xid['address']['state']
                model[:country] = response_xid['address']['country']
                model[:kinds] = response_xid['kinds']
                model[:image] = response_xid['image']
                model[:url] = response_xid['url']
                model[:description] = response_xid['wikipedia_extracts']['text']
                model[:coordenates] = "lat: #{response_xid['point']['lat']}, lon: #{response_xid['point']['lon']}"
                model.save
            end

            def register
                begin            
                    features(coordenates).each do |feature|
                        xid = feature['properties']['xid'].to_s
                        response_xid = ::Service::OpenTripMap::Request::Xid.new(xid).get
                        save_register_to_database(response_xid)
                    end
                    true
                rescue
                    false
                end
            end
        end
    end
end