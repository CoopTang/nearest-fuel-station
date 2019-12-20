require 'rails_helper'

RSpec.describe 'ApiQuerier' do
  it 'can query an API', :vcr do
    params = {
      params: {
        'api_key' => ENV['NREL_API_KEY'],
        'location' => '1331 17th St LL100, Denver, CO 80202'
      }
    }
    response = ApiQuerier.query_api(
      'https://developer.nrel.gov',
      'api/alt-fuel-stations/v1/nearest.json',
      params
    )

    expect(response[:total_results]).to eq(108)
  end
end
