# require modules here

require 'yaml'
require 'pry'
#emoticons = angel:
 # - "O:)"      
#  - "☜(⌒▽⌒)☞"
#angry:
#  - ">:("
 # - "ヽ(ｏ`皿′ｏ)ﾉ"
#bored:
#  - ":O"
#  - "(ΘεΘ;)"
#confused:
#  - "%)"
#  - "(゜.゜)"
#embarrased:
#  - ":$" 
#  - "(#^.^#)"
#fish:
#  - "><>"
#  - ">゜))))彡"
#glasses:
#  - "8D"
#  - "(^0_0^)"
#grinning:
#  - "=D"
#  - "(￣ー￣)"
#happy:
#  - ":)"
#  - "(＾ｖ＾)"
#kiss:
#  - ":*"
#  - "(*^3^)/~☆"
#sad:
#  - ":'("
#  - "(Ｔ▽Ｔ)"
#surprised:
#  - ":o"
#  - "o_O"
#wink:
#  - ";)"
#  - "(^_-)" \\
def load_library(emoticons)
library = YAML.load_file(emoticons)

result = {"get_meaning" => {}, "get_emoticon" => {}}
#binding.pry
  library.each do |meaning, emoticons|
  result["get_meaning"][emoticons[1]] = meaning
  result["get_emoticon"][emoticons[0]] = emoticons[1]
  end 
result
end



def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(english_emoticon) 
    library["get_emoticon"][english_emoticon]
  else "Sorry, that emoticon was not found"
  # code goes here
  end
end

def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  
  library = load_library(file_path)
  if library["get_meaning"].include?(japanese_emoticon) 
    library["get_meaning"][japanese_emoticon]
  else "Sorry, that emoticon was not found"
  # code goes here
  end
end