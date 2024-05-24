module Service
    module OpenTripMap
        module Request
            class ApiCommunicator           
                APIKEY = "5ae2e3f221c38a28845f05b6e508c4a294969aa40bf676eebd88c3b7"              
                BASEURL = "http://api.opentripmap.com/0.1"
                DEFAULT_LANGUAGE = "/en"

                def query_params
                    { 
                        "apikey" => APIKEY,
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