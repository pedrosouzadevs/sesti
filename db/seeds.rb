require "open-uri"
require "nokogiri"
require 'rest-client'
@saveds = []

def scrapping(type,url)
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)
  array_img = []
  type = []
  images = html_doc.css('td > a.image > img')
  images.each do |image|
    array_img << "https://www.tibiawiki.com.br/#{image['src']}"
  end
  array_img.each do |element|
    url2 = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    response = RestClient.get(url2)
    File.open(output_file, 'wb') do |file|
      file.write(response.body)
    end
    type << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
    # puts type
  end
  @saveds << "Saved"
  puts "#{@saveds.count}/47"
  return type
end

def scrapping2(type,url)
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)
  array_img = []
  type = []
  images = html_doc.css('td > img')
  images.each do |image|
    src_value = "https://www.tibiawiki.com.br#{image['src']}"# Exibe o atributo src da imagem
    unless src_value == "https://www.tibiawiki.com.br/images/thumb/6/6c/Rapidrespawn.png/50px-Rapidrespawn.png" || src_value == "https://www.tibiawiki.com.br/images/thumb/1/1e/Winter_Tree.png/50px-Winter_Tree.png" || src_value == "https://www.tibiawiki.com.br/images/2/29/Tick.png" || src_value == "https://www.tibiawiki.com.br/images/4/4e/Cross.png"
      array_img << src_value
    end
  end
  array_img.each do |element|
    url2 = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    response = RestClient.get(url2)
    File.open(output_file, 'wb') do |file|
      file.write(response.body)
    end
    type << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
    # puts @type
  end
  @saveds << "Saved"
  puts "#{@saveds.count}/47"
  return type
end

puts "Creating Helmets"
Helmet.destroy_all
url_helmets = "https://www.tibiawiki.com.br/wiki/Capacetes"
helmets = scrapping(helmets, url_helmets)
helmets.each do |element|
  Helmet.create!(name: element[:name], path: element[:path])
end
puts "Helmets Created"


puts "Creating Armors"
Armor.destroy_all
url_armors = "https://www.tibiawiki.com.br/wiki/Armaduras"
armors = scrapping(armors, url_armors)
armors.each do |element|
  Armor.create!(name: element[:name], path: element[:path])
end
puts "Armors Created"


puts "Creating Quivers,Shields and Spellbooks"
Quiver.destroy_all
url_shields = "https://www.tibiawiki.com.br/wiki/Escudos"
url_quivers = "https://www.tibiawiki.com.br/wiki/Aljavas"
url_spellbooks = "https://www.tibiawiki.com.br/wiki/Spellbooks"
quivers = scrapping(quivers, url_quivers)
shields = scrapping(shields, url_shields)
spellbooks = scrapping(spellbooks, url_spellbooks)
spellbooks.each do |element|
  Quiver.create!(name: element[:name], path: element[:path])
end
shields.each do |element|
  Quiver.create!(name: element[:name], path: element[:path])
end
quivers.each do |element|
  Quiver.create!(name: element[:name], path: element[:path])
end
puts "Quivers,Shields and Spellbooks are Created"

puts "Creating Legs"
Leg.destroy_all
url_legs = "https://www.tibiawiki.com.br/wiki/Cal%C3%A7as"
legs = scrapping(legs, url_legs)
legs.each do |element|
  Leg.create!(name: element[:name], path: element[:path])
end
puts "Legs Created"


puts "Creating Boots"
Boot.destroy_all
url_boots = "https://www.tibiawiki.com.br/wiki/Botas"
boots = scrapping(boots, url_boots)
boots.each do |element|
  Boot.create!(name: element[:name], path: element[:path])
end
puts "Boots Created"

puts "Creating Trinkets"
Trinket.destroy_all
url_trinkets = "https://www.tibiawiki.com.br/wiki/Extra_Slot"
trinkets = scrapping(trinkets, url_trinkets)
trinkets.each do |element|
  Trinket.create!(name: element[:name], path: element[:path])
end
puts "Trinkets Created"

puts "Creating Rings"
Ring.destroy_all
url_rings = "https://www.tibiawiki.com.br/wiki/An%C3%A9is"
rings = scrapping(rings, url_rings)
rings.each do |element|
  Ring.create!(name: element[:name], path: element[:path])
end
puts "Rings Created"

puts "Creating Necklaces"
Necklace.destroy_all
url_amulets_and_necklaces = "https://www.tibiawiki.com.br/wiki/Amuletos_e_Colares"
amulets_and_necklaces = scrapping(amulets_and_necklaces, url_amulets_and_necklaces)
amulets_and_necklaces.each do |element|
  Necklace.create!(name: element[:name], path: element[:path])
end
puts "Necklaces Created"

puts "Creating Weapons"
Weapon.destroy_all
url_axes = "https://www.tibiawiki.com.br/wiki/Machados"
url_rods = "https://www.tibiawiki.com.br/Rods"
url_distances = "https://www.tibiawiki.com.br/wiki/Dist%C3%A2ncia"
url_clubs = "https://www.tibiawiki.com.br/wiki/Clavas"
url_wands = "https://www.tibiawiki.com.br/wiki/Wands"
url_swords = "https://www.tibiawiki.com.br/wiki/Espadas"
rods = scrapping(rods, url_rods)
wands = scrapping(wands, url_wands)
distances = scrapping(distances, url_distances)
axes = scrapping(axes, url_axes)
clubs = scrapping(clubs, url_clubs)
swords = scrapping(swords, url_swords)
rods.each do |element|
  Weapon.create!(name: element[:name], path: element[:path], job: 1)
end
wands.each do |element|
  Weapon.create!(name: element[:name], path: element[:path], job: 2)
end
distances.each do |element|
  Weapon.create!(name: element[:name], path: element[:path], job: 3)
end
axes.each do |element|
  Weapon.create!(name: element[:name], path: element[:path], job: 4)
end
clubs.each do |element|
  Weapon.create!(name: element[:name], path: element[:path], job: 5)
end
swords.each do |element|
  Weapon.create!(name: element[:name], path: element[:path], job: 6)
end
puts "Weapons Created"

puts "Creating Rods"
Rod.destroy_all
rods.each do |element|
  weapon_id = Weapon.find_by(name: element[:name]).id
  Rod.create!(name: element[:name], path: element[:path], weapon_id: weapon_id)
end
puts "Rods Created"

puts "Creating Wands"
Wand.destroy_all
wands.each do |element|
  weapon_id = Weapon.find_by(name: element[:name]).id
  Wand.create!(name: element[:name], path: element[:path], weapon_id: weapon_id)
end
puts "Wands Created"

puts "Creating Distances"
Distance.destroy_all
distances.each do |element|
  weapon_id = Weapon.find_by(name: element[:name]).id
  Distance.create!(name: element[:name], path: element[:path], weapon_id: weapon_id)
end
puts "Distances Created"

puts "Creating Clubs"
Club.destroy_all
clubs.each do |element|
  weapon_id = Weapon.find_by(name: element[:name]).id
  Club.create!(name: element[:name], path: element[:path], weapon_id: weapon_id)
end
puts "Clubs Created"

puts "Creating Axes"
Axe.destroy_all
axes.each do |element|
  weapon_id = Weapon.find_by(name: element[:name]).id
  Axe.create!(name: element[:name], path: element[:path], weapon_id: weapon_id)
end
puts "Axes Created"

puts "Creating Swords"
Sword.destroy_all
swords.each do |element|
  weapon_id = Weapon.find_by(name: element[:name]).id
  Sword.create!(name: element[:name], path: element[:path], weapon_id: weapon_id)
end
puts "Swords Created"




url_ammunitions = "https://www.tibiawiki.com.br/wiki/Muni%C3%A7%C3%A3o"
url_old_rods_and_wands = "https://www.tibiawiki.com.br/wiki/Antigas_Wands_e_Rods"
url_foods = "https://www.tibiawiki.com.br/wiki/Comidas"
url_liquids = "https://www.tibiawiki.com.br/wiki/L%C3%ADquidos"
url_plants_and_herbs = "https://www.tibiawiki.com.br/wiki/Plantas_e_Ervas"
url_creature_products = "https://www.tibiawiki.com.br/wiki/Produtos_de_Criaturas"
url_kitchen_tools = "https://www.tibiawiki.com.br/wiki/Ferramentas_de_Cozinha"
url_lights = "https://www.tibiawiki.com.br/wiki/Fontes_de_Luz"
url_keys = "https://www.tibiawiki.com.br/wiki/Chaves"
url_mounts_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Domar"
url_tools = "https://www.tibiawiki.com.br/wiki/Ferramentas"
url_bps = "https://www.tibiawiki.com.br/wiki/Recipientes"
url_items_of_addons = "https://www.tibiawiki.com.br/wiki/Itens_de_Addons"
url_games_and_fun = "https://www.tibiawiki.com.br/wiki/Jogos_e_Divers%C3%A3o"
url_party_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Festa"
url_runes = "https://www.tibiawiki.com.br/wiki/Runas"
url_embuiments_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Imbuements"
url_replics_of_weapons = "https://www.tibiawiki.com.br/wiki/R%C3%A9plicas#R%C3%A9plicas_de_Armas"
url_books = "https://www.tibiawiki.com.br/wiki/Livros"
url_documents_and_papers = "https://www.tibiawiki.com.br/wiki/Documentos_e_Pap%C3%A9is"
url_instruments = "https://www.tibiawiki.com.br/wiki/Instrumentos_Musicais"
url_events_gifts = "https://www.tibiawiki.com.br/wiki/Pr%C3%AAmios_de_Eventos"
url_dolls_and_bears = "https://www.tibiawiki.com.br/wiki/Dolls_e_Bears"
url_trophies = "https://www.tibiawiki.com.br/wiki/Trof%C3%A9us"
url_decoration_runes = "https://www.tibiawiki.com.br/wiki/Runas_de_Decora%C3%A7%C3%A3o"
url_decorations = "https://www.tibiawiki.com.br/wiki/Decora%C3%A7%C3%B5es"
url_quest_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Quest"
url_valuable = "https://www.tibiawiki.com.br/wiki/Valiosos"
url_enchanted_items = "https://www.tibiawiki.com.br/wiki/Itens_Encantados"
url_crystals = "https://www.tibiawiki.com.br/wiki/Cristais_(Itens)"
url_garbages = "https://www.tibiawiki.com.br/wiki/Lixos"


ammunitions           = scrapping(ammunitions, url_ammunitions)
old_rods_and_wands    = scrapping(old_rods_and_wands, url_old_rods_and_wands)
foods                 = scrapping(foods, url_foods)
liquids               = scrapping(liquids, url_liquids)
plants_and_herbs      = scrapping(plants_and_herbs, url_plants_and_herbs)
creature_products     = scrapping(creature_products, url_creature_products)
kitchen_tools         = scrapping(kitchen_tools, url_kitchen_tools)
lights                = scrapping(lights, url_lights)
keys                  = scrapping(keys, url_keys)
mounts_items          = scrapping(mounts_items, url_mounts_items)
tools                 = scrapping(tools, url_tools)
bps                   = scrapping(bps, url_bps)
items_of_addons       = scrapping(items_of_addons, url_items_of_addons)
games_and_fun         = scrapping(games_and_fun, url_games_and_fun)
replics_of_weapons    = scrapping2(replics_of_weapons, url_replics_of_weapons)
books                 = scrapping2(books, url_books)
documents_and_papers  = scrapping2(documents_and_papers, url_documents_and_papers)
instruments           = scrapping2(instruments, url_instruments)
events_gifts          = scrapping2(events_gifts, url_events_gifts)
dolls_and_bears       = scrapping2(dolls_and_bears, url_dolls_and_bears)
trophies              = scrapping2(trophies, url_trophies)
decoration_runes      = scrapping2(decoration_runes, url_decoration_runes)
decorations           = scrapping2(decorations, url_decorations)
party_items           = scrapping(party_items, url_party_items)
runes                 = scrapping(runes, url_runes)
embuiments_items      = scrapping(embuiments_items, url_embuiments_items)
quest_items           = scrapping2(quest_items, url_quest_items)
valuable              = scrapping2(valuable, url_valuable)
enchanted_items       = scrapping2(enchanted_items, url_enchanted_items)
crystals              = scrapping2(crystals, url_crystals)
garbages              = scrapping2(garbages, url_garbages)

puts "Creating Items"
Item.destroy_all
ammunitions.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
old_rods_and_wands.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
foods.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
liquids.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
plants_and_herbs.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
creature_products.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
kitchen_tools.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
lights.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
keys.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
mounts_items.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
tools.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
bps.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
items_of_addons.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
games_and_fun.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
replics_of_weapons.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
books.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
documents_and_papers.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
instruments.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
events_gifts.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
dolls_and_bears.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
trophies.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
decoration_runes.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
decorations.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
party_items.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
runes.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
embuiments_items.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
quest_items.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
valuable.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
enchanted_items.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
crystals.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
garbages.each do |element|
  Item.create!(name: element[:name], path: element[:path])
end
puts "Items Created"

urls_creatures = ["https://www.tibiawiki.com.br/wiki/Anf%C3%ADbios", "https://www.tibiawiki.com.br/wiki/Aqu%C3%A1ticos", "https://www.tibiawiki.com.br/wiki/Aves", "https://www.tibiawiki.com.br/wiki/Bosses", "https://www.tibiawiki.com.br/wiki/Constructos", "https://www.tibiawiki.com.br/wiki/Criaturas_M%C3%A1gicas", "https://www.tibiawiki.com.br/wiki/Dem%C3%B4nios", "https://www.tibiawiki.com.br/wiki/Drag%C3%B5es", "https://www.tibiawiki.com.br/wiki/Elementais", "https://www.tibiawiki.com.br/wiki/Extra_Dimensionais", "https://www.tibiawiki.com.br/wiki/Fadas", "https://www.tibiawiki.com.br/wiki/Gigantes", "https://www.tibiawiki.com.br/wiki/Humanos", "https://www.tibiawiki.com.br/wiki/Human%C3%B3ides", "https://www.tibiawiki.com.br/wiki/Imortais", "https://www.tibiawiki.com.br/wiki/Licantropos", "https://www.tibiawiki.com.br/wiki/Mam%C3%ADferos", "https://www.tibiawiki.com.br/wiki/Mortos-Vivos", "https://www.tibiawiki.com.br/wiki/Plantas_(Criatura)", "https://www.tibiawiki.com.br/wiki/R%C3%A9pteis", "https://www.tibiawiki.com.br/wiki/Slimes", "https://www.tibiawiki.com.br/wiki/The_Ruthless_Seven", "https://www.tibiawiki.com.br/wiki/Triangle_of_Terror", "https://www.tibiawiki.com.br/wiki/Vermes"]

creatures_1           = scrapping(creatures_1, urls_creatures[0])
creatures_2           = scrapping(creatures_2, urls_creatures[1])
creatures_3           = scrapping(creatures_3, urls_creatures[2])
creatures_4           = scrapping(creatures_4, urls_creatures[3])
creatures_5           = scrapping(creatures_5, urls_creatures[4])
creatures_6           = scrapping(creatures_6, urls_creatures[5])
creatures_7           = scrapping(creatures_7, urls_creatures[6])
creatures_8           = scrapping(creatures_8, urls_creatures[7])
creatures_9           = scrapping(creatures_9, urls_creatures[8])
creatures_10          = scrapping(creatures_10, urls_creatures[9])
creatures_11          = scrapping(creatures_11, urls_creatures[10])
creatures_12          = scrapping(creatures_12, urls_creatures[11])
creatures_13          = scrapping(creatures_13, urls_creatures[12])
creatures_14          = scrapping(creatures_14, urls_creatures[13])
creatures_15          = scrapping(creatures_15, urls_creatures[14])
creatures_16          = scrapping(creatures_16, urls_creatures[15])
creatures_17          = scrapping(creatures_17, urls_creatures[16])
creatures_18          = scrapping(creatures_18, urls_creatures[17])
creatures_19          = scrapping(creatures_19, urls_creatures[18])
creatures_20          = scrapping(creatures_20, urls_creatures[19])
creatures_21          = scrapping(creatures_21, urls_creatures[20])
creatures_22          = scrapping(creatures_22, urls_creatures[21])
creatures_23          = scrapping(creatures_23, urls_creatures[22])
creatures_24          = scrapping(creatures_24, urls_creatures[23])

puts "Creating Creatures"
creatures_1.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_2.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_3.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_4.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_5.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_6.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_7.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_8.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_8.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_10.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_11.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_12.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_13.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_14.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_15.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_16.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_17.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_18.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_19.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_20.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_21.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_22.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_23.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
creatures_24.each do |element|
  Creature.create!(name: element[:name], path: element[:path])
end
puts "Creatures Created"
