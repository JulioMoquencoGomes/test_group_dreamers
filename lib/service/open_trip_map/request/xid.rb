require 'uri'
require 'httparty'

module Service
    module OpenTripMap
        module Request
            class Xid < ApiCommunicator
                def initialize(xid = nil, language = nil)
                    @xid = xid
                    @default_language = language == nil ? DEFAULT_LANGUAGE : language
                end

                def query_params
                    super.merge({})
                end

                def headers_params
                    super.merge({})
                end

                def get
                    return nil if @xid == nil
                    full_url = URI("#{BASEURL}#{@default_language}/places/xid/#{@xid}")
                    HTTParty.get(full_url, :query => query_params, :headers => headers_params)
                end

            end
        end
    end
end