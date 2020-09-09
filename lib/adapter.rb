class API 

    API_KEY=''
    BASE_URL='https://api.spoonacular.com/recipes/random'

    def self.fetch_random_recipes(num)
        # build the url string
        url = BASE_URL + '?apiKey=' + API_KEY + "&number=#{num}"
        # binding.pry
        # make the http request
        uri = URI.parse(url)
        # resp = Net::HTTP.get_response(uri)
        # JSON.parse(resp.body)
        # return the body of the response
        body = uri.read
        # convert the JSON into a hash
        data = JSON.parse(body)
        # binding.pry
        # use hash/array manipulation to grab desired data out of returned json
        data["recipes"].each do |recipe|
            Recipe.new(recipe["title"], recipe["instructions"], recipe["readyInMinutes"])
        end
        binding.pry
        # instantiate recipe objects with the data
        # Recipe.new(# data we grabbed from the json response)
    end

end