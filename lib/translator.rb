# require modules here
require 'yaml'
require 'pry'

def load_library(yaml_file)
  original_hash = YAML.load_file(yaml_file)
  new_hash = {}
  new_hash[:get_meaning] = {}
  new_hash[:get_emoticon] = {}
  
  original_hash.each do |meaning, emoticons|
        #if !new_hash[:get_meaning][emoticons[1]]
        new_hash[:get_meaning][emoticons[1]] = meaning.to_s
        #end
        
        #if !new_hash[:get_emoticon][emoticons[0]]
        new_hash[:get_emoticon][emoticons[0]] = emoticons[1].to_s
        #end
  end
  new_hash
end

def get_japanese_emoticon(yaml_file, w_emoticon)
  hash = load_library(yaml_file)
   hash[:get_emoticon][w_emoticon] ? hash[:get_emoticon][w_emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file,j_emoticon)
  hash = load_library(yaml_file)
  hash[:get_meaning][j_emoticon] ? hash[:get_meaning][j_emoticon] : "Sorry, that emoticon was not found"
end

