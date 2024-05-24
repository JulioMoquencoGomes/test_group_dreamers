require 'uri'
require 'httparty'

module Service
    module OpenTripMap
        module Request
            class Bbox < ApiCommunicator

                DEFAULT_MIN_LAT = 0.010
                DEFAULT_MIN_LNG = 0.010

                def initialize(lat, lng, src_geom = "osm", src_attr = "osm", rate = 3, 
                                         formatGeo = "geojson", language = nil)
                    @lat = lat.to_f
                    @lng = lng.to_f
                    @src_geom = src_geom
                    @src_attr = src_attr
                    @rate = rate
                    @formatGeo = formatGeo
                    @default_language = language == nil ? DEFAULT_LANGUAGE : language
                end

                def query_params
                    super.merge({

                        "lon_min" => @lng-DEFAULT_MIN_LNG,
                        "lon_max" => @lng,

                        "lat_min" => @lat-DEFAULT_MIN_LAT,
                        "lat_max" => @lat,

                        "src_geom" => @src_geom,
                        "src_attr" => @src_attr,
                        "rate" => @rate,
                        "format" => @formatGeo,

                    })
                end

                def headers_params
                    super.merge({})
                end

                def get
                    return nil if(@lat == nil && @lng == nil)
                    full_url = URI("#{BASEURL}#{@default_language}/places/bbox")
                    HTTParty.get(full_url, :query => query_params, :headers => headers_params)
                    
                end

            end
        end
    end
end