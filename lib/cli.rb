class CLI
    @@recipes = []

    def main
        greet_user
        menu
        list_recipes
        prompt_for_recipe
        say_goodbye
    end

    def greet_user
        puts "\nWelcome to our recipe app! How many Random Recipes do you want to view?\n"
    end

    def menu
        puts "\nEnter number less than 50 to view recipes."
        puts "\nEnter `exit` to exit the program."
        input = gets.chomp
        if input.to_i > 0 && input.to_i < 50
            fetch_recipes(input.to_i)
        end
        unless input == `exit`
            menu
        end
    end

    def fetch_recipes(num)
        # get recipe data from external source and display a table of contents with recipe names to user
        recipes_hash = API.new('https://api.spoonacular.com/recipes/random').fetch_random_recipes(num)
        @@recipes = recipes_hash.map do |recipe_hash|
            Recipe.new(recipe_hash)
        end

    end

    def prompt_for_recipe
        # use the gets method to take in user selection of recipe to learn more about
        puts "Which recipe do you want to learn more about?"
        # get user input
        input = gets.chomp
        # prompt user for input until they enter valid character
        while !["1","2","3","4","5"].include?(input)
            puts "you entered wrong, please enter again"
            input = gets.chomp
        end
        # if they enter valid input, show them correct recipe details
        # consider encapsulating into other method?
        show_recipe_detail(@@recipes[input.to_i - 1])
    end

    def say_goodbye
        "thanks for using the recipe app!"
    end

    def list_recipes
        Recipe.all.each.with_index(1) do |recipe, i|
            puts "#{i}. #{recipe.name} - #{recipe.duration} minutes\n\n"
            # output = <<~LIST.strip
            # #{i}. #{recipe.name} - #{recipe.duration} minutes

            # #{recipe.instructions}
            # LIST
        end
    end

    def show_recipe_detail(recipe)
        replacements = ["<ol>", "</ol>", "</li>"]
        instructions = recipe.instructions
        replacements.each do |tag|
            instructions = instructions.gsub(tag, "")
        end
        instructions_array = instructions.split("<li>")
        instructions_array.shift
        puts "-------------- #{recipe.name} --------------"
        instructions_array.each.with_index(1) do |instruction, i|
            puts "#{i}. #{instruction}"
        end
    end

end