require "open-uri"
require "nokogiri"
require "rest-client"

@url_helmets = "https://www.tibiawiki.com.br/wiki/Capacetes"
@url_armors = "https://www.tibiawiki.com.br/wiki/Armaduras"
@url_shields = "https://www.tibiawiki.com.br/wiki/Escudos"
@url_legs = "https://www.tibiawiki.com.br/wiki/Calças"
@url_spellbooks = "https://www.tibiawiki.com.br/wiki/Spellbooks"
@url_boots = "https://www.tibiawiki.com.br/wiki/Botas"
@url_quivers = "https://www.tibiawiki.com.br/wiki/Aljavas"
@url_trinkets = "https://www.tibiawiki.com.br/wiki/Extra_slot"

def save_gifs
  response = RestClient.get(url)
  File.open(output_file, 'wb') do |file|
    file.write(response.body)
  end
end

def scrapping_helmets
  html_file = URI.open(@url_helmets).read
  html_doc = Nokogiri::HTML.parse(html_file)
  helmets_img = []
  @helmets = []
  images_helmets = html_doc.css('td > a.image > img')
  images_helmets.each do |image|
    helmets_img << "https://www.tibiawiki.com.br/#{image['src']}"# Exibe o atributo src da imagem
  end
  helmets_img.each do |element|
    url = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    if File.exist?(output_file)
      local_content = File.binread(output_file)
      remote_content = RestClient.get(url).body
      local_content == remote_content ? next : save_gifs
    end
    @helmets << {
      name: name,
    path: "#{output_folder}/#{element}"
    }
  end
  puts "helmets are saved"
end

def scrapping_armors
  html_file = URI.open(@url_armors).read
  html_doc = Nokogiri::HTML.parse(html_file)
  armors_img = []
  @armors = []
  images_armors = html_doc.css('td > a.image > img')
  images_armors.each do |image|
    armors_img << "https://www.tibiawiki.com.br/#{image['src']}"# Exibe o atributo src da imagem
  end
  armors_img.each do |element|
    url = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    if File.exist?(output_file)
      local_content = File.binread(output_file)
      remote_content = RestClient.get(url).body
      local_content == remote_content ? next : save_gifs
    end
    @armors << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
  end
  puts "armors are saved"
end

def scrapping_shields
  html_file = URI.open(@url_shields).read
  html_doc = Nokogiri::HTML.parse(html_file)
  shields_img = []
  @shields = []
  images_shields = html_doc.css('td > a.image > img')
  images_shields.each do |image|
    shields_img << "https://www.tibiawiki.com.br/#{image['src']}"# Exibe o atributo src da imagem
  end
  shields_img.each do |element|
    url = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    if File.exist?(output_file)
      local_content = File.binread(output_file)
      remote_content = RestClient.get(url).body
      local_content == remote_content ? next : save_gifs
    end
    @shields << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
  end
  puts "shields are saved"
end

def scrapping_legs
  html_file = URI.open(@url_legs).read
  html_doc = Nokogiri::HTML.parse(html_file)
  legs_img = []
  @legs = []
  images_legs = html_doc.css('td > a.image > img')
  images_legs.each do |image|
    legs_img << "https://www.tibiawiki.com.br/#{image['src']}"# Exibe o atributo src da imagem
  end
  legs_img.each do |element|
    url = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    if File.exist?(output_file)
      local_content = File.binread(output_file)
      remote_content = RestClient.get(url).body
      local_content == remote_content ? next : save_gifs
    end
    @legs << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
  end
  puts "legs are saved"
end

def scrapping_spellbooks
  html_file = URI.open(@url_spellbooks).read
  html_doc = Nokogiri::HTML.parse(html_file)
  spellbooks_img = []
  @spellbooks = []
  images_spellbooks = html_doc.css('td > a.image > img')
  images_spellbooks.each do |image|
    spellbooks_img << "https://www.tibiawiki.com.br/#{image['src']}"# Exibe o atributo src da imagem
  end
  spellbooks_img.each do |element|
    url = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    if File.exist?(output_file)
      local_content = File.binread(output_file)
      remote_content = RestClient.get(url).body
      local_content == remote_content ? next : save_gifs
    end
    @spellbooks << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
  end
  puts "spellbooks are saved"
end

def scrapping_boots
  html_file = URI.open(@url_boots).read
  html_doc = Nokogiri::HTML.parse(html_file)
  boots_img = []
  @boots = []
  images_boots = html_doc.css('td > a.image > img')
  images_boots.each do |image|
    boots_img << "https://www.tibiawiki.com.br/#{image['src']}"# Exibe o atributo src da imagem
  end
  boots_img.each do |element|
    url = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    if File.exist?(output_file)
      local_content = File.binread(output_file)
      remote_content = RestClient.get(url).body
      local_content == remote_content ? next : save_gifs
    end
    @boots << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
  end
  puts "boots are saved"
end

def scrapping_quivers
  html_file = URI.open(@url_quivers).read
  html_doc = Nokogiri::HTML.parse(html_file)
  quivers_img = []
  @quivers = []
  images_quivers = html_doc.css('td > a.image > img')
  images_quivers.each do |image|
    quivers_img << "https://www.tibiawiki.com.br/#{image['src']}"# Exibe o atributo src da imagem
  end
  quivers_img.each do |element|
    url = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    if File.exist?(output_file)
      local_content = File.binread(output_file)
      remote_content = RestClient.get(url).body
      local_content == remote_content ? next : save_gifs
    end
    @quivers << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
  end
  puts "quivers are saved"
end

def scrapping_trinkets
  html_file = URI.open(@url_trinkets).read
  html_doc = Nokogiri::HTML.parse(html_file)
  trinkets_img = []
  @trinkets = []
  images_trinkets = html_doc.css('td > a.image > img')
  images_trinkets.each do |image|
    trinkets_img << "https://www.tibiawiki.com.br/#{image['src']}"# Exibe o atributo src da imagem
  end
  trinkets_img.each do |element|
    url = element
    name = File.basename(element, ".*").gsub(/%28/,"(").gsub(/%29/,")").gsub(/%27/,"'").gsub(/_/," ")
    gif_filename = "#{name}.gif"
    output_folder = "/home/pdro/code/pedrosouzadevs/sesti/app/assets/images/items"
    output_file = File.join(output_folder, gif_filename)
    if File.exist?(output_file)
      local_content = File.binread(output_file)
      remote_content = RestClient.get(url).body
      local_content == remote_content ? next : save_gifs
    end
    @trinkets << {
      name: name,
      path: "#{output_folder}/#{element}"
    }
  end
  puts "trinkets are saved"
end

scrapping_armors
scrapping_boots
scrapping_helmets
scrapping_legs
scrapping_quivers
scrapping_shields
scrapping_spellbooks
scrapping_trinkets
# Primeiro tem que fazer os hashs e depois botar eles em um array.
# Após isso juntar os arrays com .append
# Depois isso usar o .flatten para remover os arrays por fora
# e quando quiser procurar por algo utilizar:
# weapons.select{|x| x==name:"thunder hammer"}
