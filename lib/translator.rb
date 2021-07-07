# require modules here
require "yaml"
require "pp"

def load_library(directory)
  get_meaning = {}
  get_emoticon = {}
  YAML.load_file(directory).each do |name, data|
    get_meaning[data[1]] = name
    get_emoticon[data[0]] = data[1]
  end
  translations = {"get_meaning" => get_meaning, "get_emoticon" => get_emoticon}
  translations
end

def get_japanese_emoticon(directory, emoticon)
  translations = load_library(directory)
  if translations["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  end
  translations["get_emoticon"][emoticon]
end

def get_english_meaning(directory, emoticon)
  translations = load_library(directory)
   if translations["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  end
  translations["get_meaning"][emoticon]
end




