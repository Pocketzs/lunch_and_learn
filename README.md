
# Ruby on Rails Student Project

This Ruby on Rails app is a student project aimed at exploring the following learning goals:

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository to your local machine:
   ```
   git clone https://github.com/your-username/lunch_and_learn.git
   ```

2. Install the necessary gems:
   ```
   bundle install
   ```

3. Set up the database:
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the server:
   ```
   rails server
   ```

5. Explore the API endpoints using your preferred API client. You will need to provide an authentication token to access some of the endpoints.  This app is not deployed and should be explored in your localhost:3000

## API Endpoints

This app exposes the following API endpoints:

| Endpoint | HTTP Method | CRUD Method | Description | Authentication |
| --- | --- | --- | --- | --- |
| \`/api/v1/recipes\` | GET | Index | Get a list of all recipes for a country.  Country name CAN be specifed with the param country=<countryname>.  If no param given, a random country's recipes will be returned. | No |
| \`/api/v1/learning_resource\` | GET | Index | Get a single youtube video and several images as learning resources for a given country.  Country name MUST be specifed with the param country=<countryname>. | No |
| \`/api/v1/user\` | POST | Create | Create a user.  Name and email must be passed in the body of the request.  Emails must be unique | No |
| \`/api/v1/favorites\` | POST | Create | Create a user's favorite recipe record.  The API key of the user you are creating favorites for MUST be passed along with favorite info in the body of the request. | Yes |
| \`/api/v1/favorites\` | GET | Index | Get all of a user's favorite recipes.  User API key can be passed in either the body or params of the request as api_key: <valid_user_api_key> | Yes |



### External Data Endpoint

The \`/api/v1/external-data\` endpoint aggregates data from multiple external APIs. To reduce external API calls during testing, we have used a mocking tool called VCR to record HTTP interactions and replay them in subsequent test runs. If you need to update the recordings, you can delete the \`spec/cassettes\` directory and run the tests again.   

All of the external API calls require keys or tokens that can be aquired at the respective websites.  All external keys are referenced in `config/application.yml` as environment variables.
Once you have aquired your own keys for each external API call please assign them as environment variables like so   
```
edamam_app_id: <your_edamam_app_id>
edamam_app_key: <your_edamam_app_key>
places_api_key: <your_places_api_key>
youtube_api_key: <your_youtube_api_key>
unsplash_access_key: <your_unsplash_api_key>
```

## Testing

This project includes tests for both API consumption and exposure. We have used the RSpec testing framework and the following tools:

- VCR for recording HTTP interactions
- FactoryBot/Faker for generating test data
- Shoulda Matchers for writing concise and easy-to-read tests
- Simplecov for code coverage analysis

To run the tests, execute the following command:

```bash
bundle exec rspec
```

## Example API Endpoint Responses
---
`GET /api/v1/recipes?country=thailand`
<details>
  <summary>Response Snippet</summary>

```
{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFMaCXVzLWVhc3QtMSJIMEYCIQD8yTzcZWvHgGrqe8QxAqPgo8GHx4xUcp9fkvvagCeDlQIhAOgpPIyVXmD7y2DDoIXk%2BQNQz9s4pObGbQa0bWKRmxZiKsIFCPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2Igzwil2Pd94%2F93aVlp4qlgUWFJXcDWBNIeWNdx9OWZP%2Bnwspgdx6fQSq0%2FzHEjdwnKGp%2Boqr6GqXlVJiMhA6to5unr3F85qTCLq3noKj26RnWg99JzB4RxoijmB8CAGvE%2FFg9RqoQOd7wCIzfoQWHz47yjweuZ%2BQTN88DdcNJbr2i04DwV3RGLIiYTrkPyu6y8L012Ynrh4MgOCW2zgU5wmdZRXybxmLSGrXowPgdhz8yLZl6L9%2BH6BRnN23MWCTEKurg4hjQeW3Du8vMkYlYIzI9ImssDKezr4R9mwvObLckysNMwgw4fdcw8ybWLXZwK%2F8Akr1Sno0B7fzFH4%2BYmBn24An2mV3cCNUxAOBDb0mvQlPkvTyamB0b%2BfRkuxsOE%2BvuyEuHLFW926Q2VvYXyFODxR%2Fon2M3X3ZG8%2B8u2WrMzi837JQpUrb8kmpLxTq3iBrUvCyMrFoaJGnUS9sIcwSdYOjc6plBKKAM%2BhX4UUqRWLumzyDFg22SPoHIulDJXXiLiZqBQlwqL%2BJbcY2LQ%2FzTmuJO35n3iJ8luSYJNf4eAF87uDJcBINGaKAHZTYOpPHyovPhKIEnV4knJaV36G7qILSPPBuBy0EZnRf9w4vEmPMIVO1JXdNCJZjWP%2BKBAuR7jL7j1G3JFXlNARssgRsYF8w%2FjEVWTjybCCRCsPf23B5W69Z2gGucVITQKQqeRB31d60W5VCPMuSrE5ugV60Y5Cm62Od7WAsnG9xQ%2F83PLL5ZgIppi3kLqTv09iUkYD%2BCY89m0HE5%2B0uB1TAhjp2bKLqZh8C%2FW7oiNbuF5FqYD4uOvtE2NcUOb2isPOkeY2VhO7Q0VLJDN8icsmUXOxcbKs2oQvz2765gooDYWBaW19RUwLkOYw3lEm16ujyWPa5TduhHTDjq5WgBjqwAXACf%2Fo%2F2aN%2BcWmSSBL3SxWi9E%2FTNkDabTpdfAV5hhs3%2BTc7W3nK6DF%2FiNdrA2m2If%2Fy6p%2FWH0E9Wx%2B7gVA9Z15ZFyLS38csCNcRU3ToS7iGUn3%2FP7wcSLfEXoRVCiMX2cELhwB9wc1i0ujoBrJ0hTqTDdAJDJrydNxfj9dwqSvhJTB21s6jxnaDz72Oc2MMTZZw6bUO5189N%2BTKdK22SHbr%2B5wmPOXmSg%2B%2FL14UPqhm&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T035834Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFKUE2QJ3P%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=dffe351f52b0ee329e54462a0613cf3b88191bf09c784f71ba698666c5b217af"
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "THAI COCONUT CREMES",
                "url": "https://food52.com/recipes/37220-thai-coconut-cremes",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/8cd/8cd5ec2ff6310a088761956e4e571219.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFMaCXVzLWVhc3QtMSJIMEYCIQD8yTzcZWvHgGrqe8QxAqPgo8GHx4xUcp9fkvvagCeDlQIhAOgpPIyVXmD7y2DDoIXk%2BQNQz9s4pObGbQa0bWKRmxZiKsIFCPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2Igzwil2Pd94%2F93aVlp4qlgUWFJXcDWBNIeWNdx9OWZP%2Bnwspgdx6fQSq0%2FzHEjdwnKGp%2Boqr6GqXlVJiMhA6to5unr3F85qTCLq3noKj26RnWg99JzB4RxoijmB8CAGvE%2FFg9RqoQOd7wCIzfoQWHz47yjweuZ%2BQTN88DdcNJbr2i04DwV3RGLIiYTrkPyu6y8L012Ynrh4MgOCW2zgU5wmdZRXybxmLSGrXowPgdhz8yLZl6L9%2BH6BRnN23MWCTEKurg4hjQeW3Du8vMkYlYIzI9ImssDKezr4R9mwvObLckysNMwgw4fdcw8ybWLXZwK%2F8Akr1Sno0B7fzFH4%2BYmBn24An2mV3cCNUxAOBDb0mvQlPkvTyamB0b%2BfRkuxsOE%2BvuyEuHLFW926Q2VvYXyFODxR%2Fon2M3X3ZG8%2B8u2WrMzi837JQpUrb8kmpLxTq3iBrUvCyMrFoaJGnUS9sIcwSdYOjc6plBKKAM%2BhX4UUqRWLumzyDFg22SPoHIulDJXXiLiZqBQlwqL%2BJbcY2LQ%2FzTmuJO35n3iJ8luSYJNf4eAF87uDJcBINGaKAHZTYOpPHyovPhKIEnV4knJaV36G7qILSPPBuBy0EZnRf9w4vEmPMIVO1JXdNCJZjWP%2BKBAuR7jL7j1G3JFXlNARssgRsYF8w%2FjEVWTjybCCRCsPf23B5W69Z2gGucVITQKQqeRB31d60W5VCPMuSrE5ugV60Y5Cm62Od7WAsnG9xQ%2F83PLL5ZgIppi3kLqTv09iUkYD%2BCY89m0HE5%2B0uB1TAhjp2bKLqZh8C%2FW7oiNbuF5FqYD4uOvtE2NcUOb2isPOkeY2VhO7Q0VLJDN8icsmUXOxcbKs2oQvz2765gooDYWBaW19RUwLkOYw3lEm16ujyWPa5TduhHTDjq5WgBjqwAXACf%2Fo%2F2aN%2BcWmSSBL3SxWi9E%2FTNkDabTpdfAV5hhs3%2BTc7W3nK6DF%2FiNdrA2m2If%2Fy6p%2FWH0E9Wx%2B7gVA9Z15ZFyLS38csCNcRU3ToS7iGUn3%2FP7wcSLfEXoRVCiMX2cELhwB9wc1i0ujoBrJ0hTqTDdAJDJrydNxfj9dwqSvhJTB21s6jxnaDz72Oc2MMTZZw6bUO5189N%2BTKdK22SHbr%2B5wmPOXmSg%2B%2FL14UPqhm&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T035834Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFKUE2QJ3P%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=c34df24a1dd818c1ae90c8ae201e08ccc5d5800ec69d9de8d808fa0dedd50722"
            }
        }
    ]
}
```

</details>

---
`GET /api/v1/learning_resources?country=laos`
<details>
  <summary>Response Snippet</summary>

```
{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "Chef James Syhabout and Anthony Bourdain on the secrets behind Lao cuisine",
                "youtube_video_id": "uJGbfzixcjU"
            },
            "images": [
                {
                    "alt_tag": "time lapse photography of flying hot air balloon",
                    "url": "https://images.unsplash.com/photo-1540611025311-01df3cef54b5?ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTY3ODI1MTQyOQ&ixlib=rb-4.0.3"
                },
                {
                    "alt_tag": "aerial view of city at daytime",
                    "url": "https://images.unsplash.com/photo-1570366583862-f91883984fde?ixid=Mnw0MTkzMDd8MHwxfHNlYXJjaHwyfHxsYW9zfGVufDB8fHx8MTY3ODI1MTQyOQ&ixlib=rb-4.0.3"
                }
            ]
        }
    }
}
```
</details>

---
`POST /api/v1/users`

Required Body Example:   
```
{
  "name": "Athena Dao",
  "email": "athenadao@bestgirlever.com"
}
```
<details>
  <summary>Response Snippet</summary>

```
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "name": "Athena Dao",
            "email": "athenadao@bestgirlever.com",
            "api_key": "c8a4793b-e49e-46c6-af97-4cbd3040601e"
        }
    }
}
```
</details>

---
`POST /api/v1/favorites`

Required Body Example:   
```
{
    "api_key": <VALID_USER_API_KEY>,
    "country": "thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
}
```
<details>
  <summary>Response Snippet</summary>

```
{
    "success": "Favorite added successfully"
}
```
</details>

---
`GET /api/v1/favorites?api_key=<VALID_USER_API_KEY`

<details>
  <summary>Response Snippet</summary>

```
{
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                "recipe_link": "https://www.tastingtable.com/.....",
                "country": "thailand",
                "created_at": "2023-03-08T08:57:15.485Z"
            }
        }
    ]
}
```
</details>
