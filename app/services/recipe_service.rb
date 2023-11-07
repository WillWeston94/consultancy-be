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

  def recipes_by_keyword(keyword)
    get_url("/recipes/complexSearch?query=#{keyword}&number=100")
  end

  def recipes_by_keyword_and_intolerances(keyword, intolerances)
    get_url("/recipes/complexSearch?query=#{keyword}&intolerances=#{intolerances}&number=100")
  end

  def recipes_by_id(recipe_id)
    get_url("/recipes/#{recipe_id}/information?includeNutrition=true")
  end

end