class Scraper
    attr_reader :url

    def initialize(url)
        @url = url
    end

    def scrape_recipes
        doc = Nokogiri::HTML(URI.open(self.url)) # make a request to the url and parse response with nokogiri
        doc.css("div.recipe-card").each do |recipe_card|
            name = recipe_card.css("h3.recipeCard__title").text.strip
            Recipe.new(name)
        end
    end

end