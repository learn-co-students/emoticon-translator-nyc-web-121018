require "yaml"
require 'pry'

def load_library(library)
  emoticons = YAML.load_file(library)

  new_hash = {"get_meaning" => {} , "get_emoticon" => {} }

  emoticons.each do |description, value|
    value.each do |english|
      new_hash["get_meaning"][english] = description
      new_hash["get_emoticon"][english] = value[1]
    end
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)

  emoticon_hash = load_library(path)

  emoticon_hash["get_emoticon"].each do |english, japanese|
    if emoticon == english
      return japanese
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)

  emoticon_hash = load_library(path)

  emoticon_hash["get_meaning"].each do |emo, mean|
    if emoticon == emo
      return mean 
    end
  end

  return "Sorry, that emoticon was not found"
end
