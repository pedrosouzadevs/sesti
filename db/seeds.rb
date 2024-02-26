# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require_relative 'teste_scraping'
require "open-uri"
require "nokogiri"
require 'rest-client'

scrapping_helmets
scrapping_armors
scrapping_legs
scrapping_shields
scrapping_boots
scrapping_quivers
scrapping_trinkets
scrapping_spellbooks

p @helmets
p @armors
p @legs
p @shields
p @boots
p @quiverss
p @trinkets
p @spellbooks
