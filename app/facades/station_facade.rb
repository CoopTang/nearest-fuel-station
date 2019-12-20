class StationFacade
  attr_reader :station_name,
              :station_address,
              :station_fuel_type,
              :station_access_time,
              :station_distance,
              :station_travel_time,
              :station_directions

  def initialize(location)
    @station_name        = ""
    @station_address     = ""
    @station_fuel_type   = ""
    @station_access_time = ""
    @station_distance    = ""
    @station_travel_time = ""
    @station_direction   = []
    response = NRELService.get_electric_stations(location)
    initialize_station(response)
    initialize_directions(location, @station_name)
  end

  private

  def initialize_station(response)
    station = response[:fuel_stations].first
    @station_name        = station[:station_name]
    @station_address     = address(station)
    @station_fuel_type   = station[:fuel_type_code] 
    @station_access_time = station[:access_days_time]
  end

  #out of time
  def initialize_directions(origin, destination)
    response = DirectionService.get_directions(origin, destination)
    response[:distance][:text]
    response[:duration][:text]
    response[:steps].each do |step|
      step[:html_instructions]
    end
      
  end

  def address(station)
    street = station[:street_address]
    city = station[:city]
    state = station[:state]
    zip = station[:zip]
    "#{street}, #{city}, #{state} #{zip}"
  end
end