require 'rails_helper'

# As a user
# When I visit "/"
# And I select "Turing" from the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1min)
# - The HTML direction instructions to get to that fuel station
#   "Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>"

RSpec.describe 'As a user' do
  describe 'when I visit "/" and select Turing from the start location drop down' do
    before :each do
      visit root_path

      select 'Turing', from: :location

      click_button 'Find Nearest Station'
    end
    it 'then I should be on /search', :vcr do
      expect(current_path).to eq('/search')
    end

    it 'should see the closest electric fuel station to me info: (name, address, fuel type, access times', :vcr do
      within '#station-info' do
        expect(page).to have_content('Name: Seventeenth Street Plaza')
        expect(page).to have_content('Address: 1225 17th St., Denver, CO 80202')
        expect(page).to have_content('Fuel Type: ELEC')
        expect(page).to have_content('Access Times: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')
      end
    end

    it 'should also show distance, travel time, and html direction instructions', :vcr do

    end
  end
end
