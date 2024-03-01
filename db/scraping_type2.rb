require "open-uri"
require "nokogiri"
require "rest-client"

@url_replics_of_weapons = "https://www.tibiawiki.com.br/wiki/R%C3%A9plicas#R%C3%A9plicas_de_Armas"
@url_books = "https://www.tibiawiki.com.br/wiki/Livros"
@url_documents_and_papers = "https://www.tibiawiki.com.br/wiki/Documentos_e_Pap%C3%A9is"
@url_instruments = "https://www.tibiawiki.com.br/wiki/Instrumentos_Musicais"
@url_events_gifts = "https://www.tibiawiki.com.br/wiki/Pr%C3%AAmios_de_Eventos"
@url_dolls_and_bears = "https://www.tibiawiki.com.br/wiki/Dolls_e_Bears"
@url_trophies = "https://www.tibiawiki.com.br/wiki/Trof%C3%A9us"
@url_decoration_runes = "https://www.tibiawiki.com.br/wiki/Runas_de_Decora%C3%A7%C3%A3o"
@url_decorations = "https://www.tibiawiki.com.br/wiki/Decora%C3%A7%C3%B5es"
@url_quest_items = "https://www.tibiawiki.com.br/wiki/Itens_de_Quest"
@url_valuable = "https://www.tibiawiki.com.br/wiki/Valiosos"
@url_enchanted_items = "https://www.tibiawiki.com.br/wiki/Itens_Encantados"
@url_crystals = "https://www.tibiawiki.com.br/wiki/Cristais_(Itens)"
@url_garbage = "https://www.tibiawiki.com.br/wiki/Lixos"

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
    # puts @type
  end
  @saveds << "Saved"
  puts "#{@saveds.count}/47"
end

scrapping2(@replics_of_weapons, @url_replics_of_weapons)
scrapping2(@books, @url_books)
scrapping2(@documents_and_papers, @url_documents_and_papers)
scrapping2(@instruments, @url_instruments)
scrapping2(@events_gifts, @url_events_gifts)
scrapping2(@dolls_and_bears, @url_dolls_and_bears)
scrapping2(@trophies, @url_trophies)
scrapping2(@decoration_runes, @url_decoration_runes)
scrapping2(@decorations, @url_decorations)
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
