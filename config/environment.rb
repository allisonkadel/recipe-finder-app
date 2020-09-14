require 'bundler'
Bundler.require

require 'dotenv'
Dotenv.load

# require ruby gems and code we are dependent on
require 'open-uri'
require 'net/http'
require 'json'

# option 1: manually require all of our class code
# require_relative '../lib/recipe.rb'
# require_relative '../lib/ingredient.rb'
# require_relative '../lib/cli.rb'
# require_relative '../lib/adapter.rb'

# option 2: use require_all gem to require all of our class code
require_all '../lib'