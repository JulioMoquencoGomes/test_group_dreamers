require 'swagger_helper'

RSpec.describe 'api/tourist_spot', type: :request do

  path '/api/tourist_spot' do
    parameter name: 'name', in: :query, type: :string, description: 'name', required: true
    parameter name: 'lang', in: :query, type: :string, description: 'lang'

    get('list tourist_spots') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
