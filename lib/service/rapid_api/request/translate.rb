require 'uri'
require 'httparty'

module Service
    module RapidApi
        module Request
            class Translate < ApiCommunicator
                def initialize(content = "",from_lang = "", to_lang = nil)
                    @content = content
                    @from_lang = from_lang
                    @to_lang = to_lang
                end

                def query_params
                    super.merge({})
                end

                def headers_params
                    super
                end

                def body
                    {
                        "source"    => @from_lang,
                        "target"    => @to_lang,
                        "format"    => "text",
                        "q"         => @content
                    }
                end

                def post
                    return nil if @content == nil && @to_lang == nil
                    full_url = URI(BASEURL)
                    HTTParty.post(full_url, 
                        :query      => query_params, 
                        :body       => body,
                        :headers    => headers_params)
                end

            end
        end
    end
end