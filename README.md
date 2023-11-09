# KindKitchen - Project README
# Back-End

Link to [Kind Kitchen Webiste](https://consultancy-fe-b49461b80f89.herokuapp.com/)

## Setup

- Ruby 3.2.2
- Rails 7.08
- [Faraday](https://github.com/lostisland/faraday) 
- [JSONAPI Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) 
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) 
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) 
- [VCR](https://github.com/vcr/vcr) 
- [Webmock](https://github.com/bblimke/webmock) 

## Installation Instructions
 - Fork Repository
 - `git clone <repo_name>`
 - `cd <repo_name>`
 - `bundle install`   
 - `rails db:{drop,create,migrate,seed}`
 - `rails s`

## Project Description

**KindKitchen** is a full-stack project that leverages the [Spoonacular API](https://spoonacular.com/food-api) to assist individuals find recipes.  The application was created to help those with dietary restrictions, those with soon to expire food, and those who would like an easy to use online application to quickly find recipes without a long blog post.  This repository contains the back-end portion of the project, providing an API for the [front-end application](https://github.com/WillWeston94/consultancy-fe).  This specific repository was created to handle data storage, architecturallogic, and external API interactions.  Through the creation of this repo, this application has a communication link between the front-end application and the external API.

This project has been deployed using [Heroku](https://id.heroku.com/login), and [Circle CI](https://circleci.com/) was used for Continuous Integration and Continuous Deployment.

## Database Schema
```
 create_table "user_recipes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  ```

  ## Endpoints
  ### Will return the first 100 results from the search

1. `GET /api/v1/search?q=#{search}`
_Example Response:_
```
{
    "data": [
        {
            "id": "716381",
            "type": "searched_recipe",
            "attributes": {
                "name": "Nigerian Snail Stew",
                "img_src": "https://spoonacular.com/recipeImages/716381-312x231.jpg"
            }
        }
    ]
}
```

2. `GET /api/v1/search?q=#{search}&intolerances=#{intolerances}`
_Example Response:_
```
{
    "data": [
        {
            "id": "662883",
            "type": "searched_recipe",
            "attributes": {
                "name": "Tarragon Lobster Cocktails",
                "img_src": "https://spoonacular.com/recipeImages/662883-312x231.jpg"
            }
        }
    ]
}
```

3. `GET /api/v1/search/#{id}`
_Example Response:_
```
{
    "data": {
        "id": "636732",
        "type": "recipe_details",
        "attributes": {
            "name": "Cajun Lobster Pasta",
            "img_src": "https://spoonacular.com/recipeImages/636732-556x370.jpg",
            "servings": 1,
            "readyInMinutes": 45,
            "servingSize_grams": 870,
            "instructions": [
                {
                    "1": "Cook up your bacon in a small frying pan over medium heat."
                },
                {
                    "2": "Remove the bacon and drain off the fat, reserving about a tablespoon.To the pan add in your garlic and pepper. Cook it up on medium heat for about two to three minutes."
                },
                {
                    "3": "Add in the green onions."
                },
                {
                    "4": "Let cook for an additional minute.Chop up your bacon and add it to the pan along with the broth. Love me some bacon.Now add in your spices; the cajun, old bay, onion powder, garlic powder, lemon pepper, oregano, and pepper.Allow the mixture to heat back up and then turn your heat down to medium low."
                },
                {
                    "5": "Add in your lobster and allow it about three to five minutes to heat up completely.Last up, add in your cream."
                },
                {
                    "6": "Serve your finished lobster over fresh cooked pasta with a few pinches of parmesan cheese and a sprinkle of chopped green onions over the top."
                }
            ],
            "ingredients": [
                "3 strips of Bacon",
                "1 Bell Pepper, any Color, Chopped",
                "1 Bell Pepper, any Color, Chopped",
                "3/4 cup Chicken, Seafood, or Veggie Broth",
                "1 teaspoon of Cajun Spice",
                "3 cloves of Garlic, Minced",
                "1/2 teaspoon of Garlic Powder",
                "3 Green Onions, Chopped",
                "1/4 cup of Heavy Cream",
                "1/2 teaspoon of Lemon Pepper",
                "1 pd of Lobster",
                "1 teaspoon of Old Bay Seasoning",
                "1/2 teaspoon of Onion Powder",
                "1/2 teaspoon of Oregano",
                "Pepper to taste",
                "Pepper to taste",
                "1/4 tsp salt"
            ]
        }
    }
}
```
4. `GET /api/v1/user_recipes?user_id=#{user_id}` 
_Example Response:_
```
{
    "data": [
        {
            "id": "650255",
            "type": "searched_recipe",
            "attributes": {
                "name": "Lobster Macaroni and Cheese",
                "img_src": "https://spoonacular.com/recipeImages/650255-556x370.jpg"
            }
        },
        {
            "id": "716381",
            "type": "searched_recipe",
            "attributes": {
                "name": "Nigerian Snail Stew",
                "img_src": "https://spoonacular.com/recipeImages/716381-556x370.jpg"
            }
        }
    ]
}
```

5. When posting recipes: 
`POST /api/v1/user_recipes?user_id=#{user_id}&recipe_id=#{recipe_id}`
(Empty array is returned)


  ## Contributors

- [Paul Bennett](https://www.linkedin.com/in/paul-bennett-dev/) -GitHub: [@pcbennett108](https://github.com/pcbennett108)
- [Tyler Blackmon](https://www.linkedin.com/in/tyler-blackmon/) - GitHub: [@tblackmon-tiel](https://github.com/tblackmon-tiel)
- [Nicholas McEnroe](https://www.linkedin.com/in/nicholasmcenroe/) - GitHub: [@NSMcEnroe](https://github.com/NSMcEnroe)
- [Will Weston](https://www.linkedin.com/in/weston-william/) - GitHub: [@z-fitch](https://github.com/WillWeston94)