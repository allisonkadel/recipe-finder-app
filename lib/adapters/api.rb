class API 
    attr_reader :url

    API_KEY=ENV['API_KEY']

    def initialize(url)
        @url = url
    end

    def fetch_random_recipes(num)
        # build the url string
        url = self.url + '?apiKey=' + API_KEY + "&number=#{num}"
        # make the http request
        uri = URI.parse(url)
        # return the body of the response
        body = uri.read
        # convert the JSON into a hash
        data = JSON.parse(body)
        # use hash/array manipulation to grab desired data out of returned json
        recipes = []
        data["recipes"].each do |recipe|
            # Recipe.new(recipe["title"], recipe["instructions"], recipe["readyInMinutes"])
            recipes << {name: recipe["title"], instructions: recipe["instructions"], duration: recipe["readyInMinutes"]}
        end
        recipes
    end

end

