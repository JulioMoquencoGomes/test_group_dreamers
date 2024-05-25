module Service
    module RapidApi
        class RapidApi
            def initialize(model, target = "en")
                @model  = model
                @target = target
            end
            
            def info_translate
                {
                    "name" => post_request(@model["name"]),
                    "description" => post_request(@model["description"])
                }
            end

            def lang_detected(content)
                response = ::Service::RapidApi::Request::Detects.new(content).post
                if response.present? && response["data"].present? && 
                                        response["data"]["detections"].present? &&
                                        response["data"]["detections"][0]["language"].present?
                    return response["data"]["detections"][0]["language"]
                end
                "en"
            end

            def post_request(property)
                source = lang_detected(property)
                response = ::Service::RapidApi::Request::Translate.new(property, source, @target).post
                return message_error(response) unless response.present? && response["data"].present? && 
                                        response["data"]["translations"].present? &&
                                        response["data"]["translations"][0]["translatedText"].present?
                response["data"]["translations"][0]["translatedText"]
            end

            def message_error(response)
                return response["message"] if response["message"].present?
                nil
            end
        end
    end
end