require "open-uri"
require "nokogiri"
require "rest-client"

@url_helmets = "https://www.tibiawiki.com.br/wiki/Capacetes"
@url_armors = "https://www.tibiawiki.com.br/wiki/Armaduras"
@url_shields = "https://www.tibiawiki.com.br/wiki/Escudos"
@url_legs = "https://www.tibiawiki.com.br/wiki/Cal%C3%A7as"
@url_spellbooks = "https://www.tibiawiki.com.br/wiki/Spellbooks"
@url_boots = "https://www.tibiawiki.com.br/wiki/Botas"
@url_quivers = "https://www.tibiawiki.com.br/wiki/Aljavas"
@url_trinkets = "https://www.tibiawiki.com.br/wiki/Extra_Slot"
@url_axes = "https://www.tibiawiki.com.br/wiki/Machados"
@url_rods = "https://www.tibiawiki.com.br/Rods"
@url_distances = "https://www.tibiawiki.com.br/wiki/Dist%C3%A2ncia"
@url_clubs = "https://www.tibiawiki.com.br/wiki/Clavas"
@url_wands = "https://www.tibiawiki.com.br/wiki/Wands"
@url_municions = "https://www.tibiawiki.com.br/wiki/Muni%C3%A7%C3%A3o"
@url_swords = "https://www.tibiawiki.com.br/wiki/Espadas"
@url_old_rods_and_wands = "https://www.tibiawiki.com.br/wiki/Antigas_Wands_e_Rods"
@url_replics_of_weapons = "https://www.tibiawiki.com.br/wiki/R%C3%A9plicas#R%C3%A9plicas_de_Armas"
@url_books = "https://www.tibiawiki.com.br/wiki/Livros"
@url_documents_and_papers = "https://www.tibiawiki.com.br/wiki/Documentos_e_Pap%C3%A9is"
@url_instruments = "https://www.tibiawiki.com.br/wiki/Instrumentos_Musicais"
@url_events_gifts = "https://www.tibiawiki.com.br/wiki/Pr%C3%AAmios_de_Eventos"
@url_dolls_and_bears = "https://www.tibiawiki.com.br/wiki/Dolls_e_Bears"
@url_trophies = "https://www.tibiawiki.com.br/wiki/Trof%C3%A9us"
@url_decoration_runes = "https://www.tibiawiki.com.br/wiki/Runas_de_Decora%C3%A7%C3%A3o"
@url_decorations = "https://www.tibiawiki.com.br/wiki/Decora%C3%A7%C3%B5es"
@url_foods = "https://www.tibiawiki.com.br/wiki/Comidas"
@url_liquids = "https://www.tibiawiki.com.br/wiki/L%C3%ADquidos"
@url_plants_and_herbs = "https://www.tibiawiki.com.br/wiki/Plantas_e_Ervas"
@url_creature_products = "https://www.tibiawiki.com.br/wiki/Produtos_de_Criaturas"
@url_amulets_and_necklaces = "https://www.tibiawiki.com.br/wiki/Amuletos_e_Colares"
@url_kitchen_tools = "https://www.tibiawiki.com.br/wiki/Ferramentas_de_Cozinha"
@url_rings = "https://www.tibiawiki.com.br/wiki/An%C3%A9is"
@url_lights = "https://www.tibiawiki.com.br/wiki/Fontes_de_Luz"
@url_keys = "https://www.tibiawiki.com.br/wiki/Chaves"
@url_mounts_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Domar"
@url_tools = "https://www.tibiawiki.com.br/wiki/Ferramentas"
@url_bps = "https://www.tibiawiki.com.br/wiki/Recipientes"
@url_items_of_addons = "https://www.tibiawiki.com.br/wiki/Itens_de_Addons"
@url_games_and_fun = "https://www.tibiawiki.com.br/wiki/Jogos_e_Divers%C3%A3o"
@url_party_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Festa"
@url_runes = "https://www.tibiawiki.com.br/wiki/Runas"
@url_embuiments_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Imbuements"
@url_quest_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Quest"
@url_valuable = "https://www.tibiawiki.com.br/wiki/Valiosos"
@url_enchanted_items = "https://www.tibiawiki.com.br/wiki/Itens_Encantados"
@url_crystals = "https://www.tibiawiki.com.br/wiki/Cristais_(Itens)"
@url_garbage = "https://www.tibiawiki.com.br/wiki/Lixos"

def scrapping(type,url)
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)
  array_img = []
  @type = []
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
    @type << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
    puts @type
  end
  puts "Saved"
end

def scrapping2(type,url)
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)
  array_img = []
  @type = []
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
    @type << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
    puts @type
  end
  puts "Saved"
end
scrapping(@armors, @url_armors)
scrapping(@boots, @url_boots)
scrapping(@legs, @url_legs)
scrapping(@helmets, @url_helmets)
scrapping(@shields, @url_shields)
scrapping(@spellbooks, @url_spellbooks)
scrapping(@quivers, @url_quivers )
scrapping(@trinkets, @url_trinkets)
scrapping(@axes, @url_axes)
scrapping(@rods, @url_rods)
scrapping(@distances, @url_distances)
scrapping(@clubs, @url_clubs)
scrapping(@wands, @url_wands)
scrapping(@municions, @url_municions)
scrapping(@swords, @url_swords)
scrapping(@old_rods_and_wands, @url_old_rods_and_wands)
scrapping2(@replics_of_weapons, @url_replics_of_weapons)
scrapping2(@books, @url_books)
scrapping2(@documents_and_papers, @url_documents_and_papers)
scrapping2(@instruments, @url_instruments)
scrapping2(@events_gifts, @url_events_gifts)
scrapping2(@dolls_and_bears, @url_dolls_and_bears)
scrapping2(@trophies, @url_trophies)
scrapping2(@decoration_runes, @url_decoration_runes)
scrapping2(@decorations, @url_decorations)
scrapping(@foods, @url_foods)
scrapping(@liquids, @url_liquids)
scrapping(@plants_and_herbs, @url_plants_and_herbs)
scrapping(@creature_products, @url_creature_products)
scrapping(@amulets_and_necklaces, @url_amulets_and_necklaces)
scrapping(@kitchen_tools, @url_kitchen_tools)
scrapping(@rings, @url_rings)
scrapping(@lights, @url_lights)
scrapping(@keys, @url_keys)
scrapping(@mounts_items, @url_mounts_items)
scrapping(@tools, @url_tools)
scrapping(@bps, @url_bps)
scrapping(@items_of_addons, @url_items_of_addons)
scrapping(@games_and_fun, @url_games_and_fun)
scrapping(@party_items, @url_party_items)
scrapping(@runes, @url_runes)
scrapping(@embuiments_items, @url_embuiments_items)
scrapping2(@quest_items, @url_quest_items)
scrapping2(@valuable, @url_valuable)
scrapping2(@enchanted_items, @url_enchanted_items)
scrapping2(@crystals, @url_crystals)
scrapping2(@garbage, @url_garbage)

# Primeiro tem que fazer os hashs e depois botar eles em um array.
# Após isso juntar os arrays com .append
# Depois isso usar o .flatten para remover os arrays por fora
# e quando quiser procurar por algo utilizar:
# weapons.select{|x| x==name:"thunder hammer"}
