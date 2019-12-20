class DirectionService

  def self.get_directions(origin, destination)
    response = ApiQuerier.query_api(
      'https://maps.googleapis.com',
      'maps/api/directions/json',
      params(origin, destination)
    )
  end

  private_class_method

  def self.params(origin, destination)
    {
      params: {
        'origin' => origin,
        'destination' => destination,
        'key' => ENV['MAPS_API_KEY']
      }
    }
  end
end