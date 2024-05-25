module Service
    module OpenTripMap
        module Request
            class ApiCommunicator         
                BASEURL = "http://api.opentripmap.com/0.1"
                DEFAULT_LANGUAGE = "/en"

                def query_params
                    { 
                        "apikey" => APIKEY_OPENTRIPMAP,
                    }
                end

                def headers_params
                    {
                        "accept" => "application/json"
                    }
                end
            end
        end
    end
end