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

# scrapping(@armors, @url_armors)
# scrapping(@boots, @url_boots)
# scrapping(@legs, @url_legs)
# scrapping(@helmets, @url_helmets)
# scrapping(@shields, @url_shields)
# scrapping(@spellbooks, @url_spellbooks)
# scrapping(@quivers, @url_quivers )
# scrapping(@trinkets, @url_trinkets)
# scrapping(@axes, @url_axes)
# scrapping(@rods, @url_rods)
# scrapping(@distances, @url_distances)
# scrapping(@clubs, @url_clubs)
# scrapping(@wands, @url_wands)
# scrapping(@municions, @url_municions)
# scrapping(@swords, @url_swords)
# scrapping(@old_rods_and_wands, @url_old_rods_and_wands)
# scrapping2(@replics_of_weapons, @url_replics_of_weapons)
# scrapping2(@books, @url_books)
# scrapping2(@documents_and_papers, @url_documents_and_papers)
# scrapping2(@instruments, @url_instruments)
# scrapping2(@events_gifts, @url_events_gifts)
# scrapping2(@dolls_and_bears, @url_dolls_and_bears)
# scrapping2(@trophies, @url_trophies)
# scrapping2(@decoration_runes, @url_decoration_runes)
# scrapping2(@decorations, @url_decorations)
# scrapping(@foods, @url_foods)
# scrapping(@liquids, @url_liquids)
# scrapping(@plants_and_herbs, @url_plants_and_herbs)
# scrapping(@creature_products, @url_creature_products)
# scrapping(@amulets_and_necklaces, @url_amulets_and_necklaces)
# scrapping(@kitchen_tools, @url_kitchen_tools)
# scrapping(@rings, @url_rings)
# scrapping(@lights, @url_lights)
# scrapping(@keys, @url_keys)
# scrapping(@mounts_items, @url_mounts_items)
# scrapping(@tools, @url_tools)
# scrapping(@bps, @url_bps)
# scrapping(@items_of_addons, @url_items_of_addons)
# scrapping(@games_and_fun, @url_games_and_fun)
scrapping(@party_items, @url_party_items)
scrapping(@runes, @url_runes)
scrapping(@embuiments_items, @url_embuiments_items)
scrapping2(@quest_items, @url_quest_items)
scrapping2(@valuable, @url_valuable)
scrapping2(@enchanted_items, @url_enchanted_items)
scrapping2(@crystals, @url_crystals)
scrapping2(@garbage, @url_garbage)

p @helmets
p @armors
p @legs
p @shields
p @boots
p @quiverss
p @trinkets
p @spellbooks
