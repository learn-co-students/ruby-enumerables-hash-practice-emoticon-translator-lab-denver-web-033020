# require modules here
require "yaml"

def load_library(file_path)
  library=YAML.load_file(file_path)
  
  hash= {"get_meaning" => {}, "get_emoticon" => {}}
  
  library.each{|meaning,emoticons|
    hash["get_meaning"][emoticons[1]]=meaning
    hash["get_emoticon"][emoticons[0]]=emoticons[1]
  }
  hash
end

def get_japanese_emoticon(file_path,emoticon)
  emo_library = load_library(file_path)
  result = emo_library["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(file_path,emoticon)
  emo_library = load_library(file_path)
  result = emo_library["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end