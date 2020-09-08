# What is a CLI Application?
* command line interface
* interface - what the user interacts with to access our data
* command line - takes in commands from user and processes them as text and then responds accordingly

# Building a CLI Application that fetches remote data

## Components
1. user interface - CLI
2. place to get data from - webpage (html - nested nodes) or api (json - similar to array of hashes in ruby)
3. how to get data - utility that either scrapes or fetches from an API
4. place to keep data we get - models (our classes)

## Options for fetching data
1. Scraping from 
2. request from API as json

# Recipe Domain

## Models
* Ingredients?
* Instructions?
* Chefs?
* Recipes - meal?

1. Recipes: name, instructions, duration
2. Ingredients: name, amount

## Model Relationships
1. Recipe has many Ingredients
2. Ingredient belongs to a recipe