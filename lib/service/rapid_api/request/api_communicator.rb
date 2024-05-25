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
                        "Accept-Encoding" => "application/json",
                        "X-RapidAPI-Key" => "331b91b258msha5d2fcf935a8120p11050cjsnb73b62c7492e",
                        "X-RapidAPI-Host" => "google-translator9.p.rapidapi.com"
                    }
                end
            end
        end
    end
end