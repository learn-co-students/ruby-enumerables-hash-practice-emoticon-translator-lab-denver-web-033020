require "yaml"

def load_library(lib)
library = YAML.load_file(lib)
result = {"get_meaning" => {}, "get_emoticon" => {}}
library.each do |m, e| 
  result["get_meaning"][e[1]] = m
  result["get_emoticon"][e[0]] = e[1]
end
result
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(emoticon)
    library["get_emoticon"][emoticon]
  else 
  "Sorry, that emoticon was not found" 
end
end

def get_english_meaning(file_path = './lib/emoticons.yml', emoticon)
  library = load_library(file_path)
  if library["get_meaning"].include?(emoticon)
    library["get_meaning"][emoticon]
  else 
    "Sorry, that emoticon was not found"
end
end