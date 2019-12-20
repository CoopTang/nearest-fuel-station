class NRELService


  def self.get_electric_stations(location)
    ApiQuerier.query_api(
      'https://developer.nrel.gov',
      'api/alt-fuel-stations/v1/nearest.json',
      create_params(location)
    )
  end

  private_class_method

  def self.create_params(location)
    { 
      params: {
        'location' => location,
        'api_key' => ENV['NREL_API_KEY']
      }
    }
  end
end