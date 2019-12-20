class StationFacade
  attr_reader :station_name,
              :station_address,
              :station_fuel_type,
              :station_access_time

  def initialize(location)
    response = NRELService.get_electric_stations(location)
    station = response[:fuel_stations].first
    @station_name        = station[:station_name]
    @station_address     = address(station)
    @station_fuel_type   = station[:fuel_type_code] 
    @station_access_time = station[:access_days_time]
  end

  private

  def address(station)
    street = station[:street_address]
    city = station[:city]
    state = station[:state]
    zip = station[:zip]
    "#{street}, #{city}, #{state} #{zip}"
  end
end