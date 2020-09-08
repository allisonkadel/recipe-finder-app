# require ruby gems and code we are dependent on
require 'open-uri'
require 'net/http'
require 'json'

# require all of our class code
require_relative 'recipe.rb'
require_relative 'ingredient.rb'
require_relative 'cli.rb'
require_relative 'adapter.rb'