require 'uri'
require 'httparty'

module Service
    module OpenTripMap
        module Request
            class PlaceName < ApiCommunicator
                def initialize(name = "", language = nil)
                    @name = name
                    @default_language = language == nil ? DEFAULT_LANGUAGE : language
                end

                def query_params
                    super.merge({ "name" => @name })
                end

                def headers_params
                    super.merge({})
                end

                def get
                    return nil if @name == nil
                    full_url = URI("#{BASEURL}#{@default_language}/places/geoname")
                    HTTParty.get(full_url, :query => query_params, :headers => headers_params)
                end

            end
        end
    end
end