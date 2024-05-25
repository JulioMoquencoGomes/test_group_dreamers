module Service
    module RapidApi
        class RapidApi
       
            def self.translate(content, target_language = "en")
                source_language = lang_detected(content)
                return content if source_language == target_language
                post_request(content, source_language, target_language)
            end

            def self.lang_detected(content)
                response = ::Service::RapidApi::Request::Detects.new(content).post
                if response.present? && response["data"].present? && 
                                        response["data"]["detections"].present? &&
                                        response["data"]["detections"][0]["language"].present?
                    return response["data"]["detections"][0]["language"]
                end
                "en"
            end

            def self.post_request(content, source_language, target_language)
                response = ::Service::RapidApi::Request::Translate.new(content, source_language, target_language).post
                return message_error(response) unless response.present? && response["data"].present? && 
                                        response["data"]["translations"].present? &&
                                        response["data"]["translations"][0]["translatedText"].present?
                response["data"]["translations"][0]["translatedText"]
            end

            def self.message_error(response)
                return response["message"] if response["message"].present?
                nil
            end
        end
    end
end