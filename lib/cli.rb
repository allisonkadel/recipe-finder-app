class CLI

    def main
        greet_user
        fetch_recipes 
        prompt_for_recipe
        # depending on what the user selects, do more stuff afterward (like show them details about recipe)
        # this is where lots of CLI looping and logic will happen
        list_recipes
        say_goodbye
    end

    def greet_user
        puts "welcome to our recipe app!"
    end

    def fetch_recipes
        # get recipe data from external source and display a table of contents with recipe names to user
        API.fetch_random_recipes(5)
    end

    def prompt_for_recipe
        # use the gets method to take in user selection of recipe to learn more about
    end

    def say_goodbye
        "thanks for using the recipe app!"
    end

    def list_recipes
        Recipe.all.each do |recipe|
            puts recipe.name
            puts recipe.instructions
            puts recipe.duration
        end
    end

end