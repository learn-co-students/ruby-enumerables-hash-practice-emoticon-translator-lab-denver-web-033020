require 'yaml'
require 'pry'

def load_library(path)
   emoticons = YAML.load_file('./lib/emoticons.yml')
     #set a hash with get_meaning, get_emoticon as keys, empty hash for value
    emoticon_lib = {'get_meaning'  => {},
                  'get_emoticon' => {} }
    emoticons.each do |meaning, value|  
      
      english = value[0]
    japanese = value[1]
    #in original data file english emoji is first index
    emoticon_lib['get_meaning'][japanese] = meaning
    emoticon_lib['get_emoticon'][english] = japanese
    #gives us emoticon_lib => {"get meaning" => {"☜(⌒▽⌒)☞"=>"angel"  } ,   
  
  end
  emoticon_lib
end


def get_japanese_emoticon (path, emoticon)
  emoticon_lib = load_library(path)
  japanese_emoticon = emoticon_lib['get_emoticon'][emoticon]
  #if you put in an english emoticon (emoticon_lib['get_emoticon'][emoticon]) you get the japanese emoticon
   if japanese_emoticon
    japanese_emoticon
  else
    "Sorry, that emoticon was not found"
  end
  
end	


def get_english_meaning (path, emoticon)
 emoticon_lib = load_library(path)
 meaning = emoticon_lib['get_meaning'][emoticon]
 if meaning
   meaning
  else
   "Sorry, that emoticon was not found" 
  # code goes here
end
end