# require modules here
require 'yaml'

def load_library(path)
  orig_hash = YAML.load_file(path)
  translate_hash = construct_translate_hash(orig_hash)
end

def construct_translate_hash(orignal_hash)
  result = {
    :get_meaning => {},
    :get_emoticon => {}
  }

  # get the meanings
  meanings_ary = orignal_hash.map {| key, value | key }
  # get the english emoticons
  english_emoticons_ary = orignal_hash.map { |key, value | orignal_hash[key][0] }
  # get the japanese emoticons
  japanese_emoticons_ary = orignal_hash.map { |key, value | orignal_hash[key][1]}

  # create the final array
  i = 0
  while i < meanings_ary.count do
    result[:get_meaning][japanese_emoticons_ary[i]] = meanings_ary[i]
    result[:get_emoticon][english_emoticons_ary[i]] = japanese_emoticons_ary[i]
    i += 1
  end
  return result
end

def get_japanese_emoticon(path, emoticon)
  lib = load_library(path)
  result = lib[:get_emoticon][emoticon]
  if result == nil
    return "Sorry, that emoticon was not found"
  end
  return result
end

def get_english_meaning(path, emoticon)
  lib = load_library(path)
  result = lib[:get_meaning][emoticon]
  if result == nil
    return "Sorry, that emoticon was not found"
  end
  return result
end
