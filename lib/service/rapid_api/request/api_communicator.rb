module Service
    module RapidApi
        module Request
            class ApiCommunicator                    
                BASEURL = "https://google-translator9.p.rapidapi.com/v2"
                def query_params
                    {}
                end

                def headers_params
                    {
                        "Accept-Encoding"   => "application/json",
                        "X-RapidAPI-Key"    => APIKEY_RAPIDAPI
                        "X-RapidAPI-Host"   => HOST_RAPIDAPI
                    }
                end
            end
        end
    end
end