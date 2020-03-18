# require modules here
require 'yaml'
require 'pry'

# emoticon_library
# => {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
#  "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
#  "bored"=>[":O", "(ΘεΘ;)"],
#  "confused"=>["%)", "(゜.゜)"],
#  "embarrased"=>[":$", "(#^.^#)"],
#  "fish"=>["><>", ">゜))))彡"],
#  "glasses"=>["8D", "(^0_0^)"],
#  "grinning"=>["=D", "(￣ー￣)"],
#  "happy"=>[":)", "(＾ｖ＾)"],
#  "kiss"=>[":*", "(*^3^)/~☆"],
#  "sad"=>[":'(", "(Ｔ▽Ｔ)"],
#  "surprised"=>[":o", "o_O"],
#  "wink"=>[";)", "(^_-)"]}

def load_library(file_path)
  emoticon_library = YAML.load_file(file_path) # emoticon_library = result in the tests
  sorted_emoticons = {
    'get_meaning': {},
    'get_emoticon': {}
  }
  emoticon_library.each do |key, value|
    sorted_emoticons[:get_meaning][value[1]] = key #Japanese emoticon is the key; name/meaning is the value
    sorted_emoticons[:get_emoticon][value[0]] = value[1] #English emoticon is the key; Japanese emoticon is the value
  end
  sorted_emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_file = load_library(file_path)
  japanese_emoticon = emoticon_file[:get_emoticon][emoticon]
  # if japanese_emoticon
  #   japanese_emoticon
  # else
  #   "Sorry, that emoticon was not found"
  # end
  japanese_emoticon || "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticon_file = load_library(file_path)
  english_emoticon = emoticon_file[:get_meaning][emoticon]
  # if english_emoticon
  #   english_emoticon
  # else
  #   "Sorry, that emoticon was not found"
  # end
  english_emoticon || "Sorry, that emoticon was not found"
end
