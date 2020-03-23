require "yaml"

def load_library(file_path)
  translations = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |meaning, array|
  english, japanese = array
  translations["get_emoticon"][english] = japanese
  translations["get_meaning"][japanese] = meaning
  end
  translations
end

def get_japanese_emoticon(file_path, emoticon)
  translations = load_library(file_path)
  result = translations["get_emoticon"][emoticon]
  if result
  result
  else
  "Sorry, that emoticon was not found"
end
end

def get_english_meaning(file_path, emoticon)
  translations = load_library(file_path)
  result = translations["get_meaning"][emoticon]
  if result
  result
  else
  "Sorry, that emoticon was not found"
end

end
