module Service
    module OpenTripMap
        class TouristSpot

            def self.translate(tourist_name, target_language = "en")
                ::Service::RapidApi::RapidApi.translate(tourist_name, target_language)
            end

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

            def self.save_to_database(place)
                model = ::TouristSpot.new(place)
                model.save
            end

            def self.search_in_database(reference)
                ::TouristSpot.where("name LIKE :name or city LIKE :city or state LIKE :state or country LIKE :country or description LIKE :description or kinds LIKE :kinds", 
                {
                    :name       => "%#{reference}%",
                    :city       => "%#{reference}%",
                    :state      => "%#{reference}%",
                    :country    => "%#{reference}%",
                    :description       => "%#{reference}%",
                    :kinds => "%#{reference}%" 
                })
            end

            def self.search_in_api(name, lang)
                name = translate(name, lang)
                translated_places = []
                features(coordenates(name)).each do |feature|
                    xid = feature['properties']['xid'].to_s
                    response_xid = ::Service::OpenTripMap::Request::Xid.new(xid).get
                    translate_place = {         
                        name:           translate(response_xid['name'], lang),
                        xid:            translate(response_xid['xid'], lang),
                        city:           translate(response_xid['address']['city'], lang),
                        state:          translate(response_xid['address']['state'], lang),
                        country:        translate(response_xid['address']['country'], lang),
                        kinds:          translate(response_xid['kinds'], lang),
                        image:          response_xid['image'],
                        url:            response_xid['url'],
                        description:    translate(response_xid['wikipedia_extracts']['text'], lang),
                        coordenates:    translate("lat: #{response_xid['point']['lat']}, lon: #{response_xid['point']['lon']}", lang)
                    }
                    save_to_database(translate_place)
                    translated_places.push(translate_place)
                end
                translated_places
            end

            def self.search(name, lang = "en")
                return false if name.nil? || name.blank?
                begin            
                    places = search_in_database(name)
                    return places unless places.empty?
                    search_in_api(name, lang)
                rescue
                    nil
                end
            end
        end
    end
end