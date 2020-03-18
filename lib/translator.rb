require 'yaml'
require 'pry'
#pp emoticons_file

# require modules here

def load_library(filepath)
  emoticons_file = YAML.load_file("./lib/emoticons.yml")
  #emoticons_file[get_meaning] = get_emoticon
 return emoticons_file
end

def get_japanese_emoticon(filepath, emoticon)
  emoticons_file = load_library(filepath)
  #binding.pry
  if emoticons_file['get_emoticon'][emoticon]
    return emoticons_file['get_emoticon'][emoticon]
  else 
     return "Sorry, that emoticon was not found"
  end
end



def get_english_meaning(filepath, emoticon)
  emoticons_file = load_library(filepath)
   if emoticons_file['get_meaning'][emoticon]
    return emoticons_file['get_meaning'][emoticon]
  else 
     return "Sorry, that emoticon was not found"
  end
end
