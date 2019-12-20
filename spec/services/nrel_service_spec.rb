require 'rails_helper'

RSpec.describe 'NRELService' do
  it 'Can get get the nearest electric stations for Turing', :vcr do
    location = '1331 17th St LL100, Denver, CO 80202'

    response = NRELService.get_electric_stations(location)

    binding.pry

    expect(response[:total_results]).to eq(108)
    expect(response[:fuel_stations].first[:fuel_type_code]).to eq('ELEC')
    expect(response[:fuel_stations].first[:station_name]).to eq('Seventeenth Street Plaza')
  end
end
