require 'uri'
require 'httparty'

module Service
    module RapidApi
        module Request
            class Detects < ApiCommunicator
                def initialize(content)
                    @content
                end

                def query_params
                    super.merge({})
                end

                def headers_params
                    super
                end

                def body
                    {
                        "q"         => @content
                    }
                end

                def post
                    return nil if @content == nil && @to_lang == nil
                    full_url = URI("#{BASEURL}/detect")
                    HTTParty.post(full_url, 
                        :query      => query_params, 
                        :body       => body,
                        :headers    => headers_params)
                end

            end
        end
    end
end