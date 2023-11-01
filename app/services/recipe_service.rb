class RecipeService

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.spoonacular.com') do |faraday|
      faraday.params['apiKey'] = Rails.application.credentials.spoonacular[:key]
    end
  end
end