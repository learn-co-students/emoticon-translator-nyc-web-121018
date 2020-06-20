require "yaml"


def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon = {}

  emoticon["get_emoticon"] = {}
  emoticon["get_meaning"] = {}

  emoticons.each do |english_word, emoticon_set|
    emoticon["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon["get_meaning"][emoticon_set.last] = english_word
  end
  emoticon
end

def get_japanese_emoticon(path, emoticon)
  translator =load_library(path)
  jap_emo = translator["get_emoticon"][emoticon]
  if jap_emo == nil
     jap_emo =  "Sorry, that emoticon was not found"
  end
  return jap_emo
end

def get_english_meaning(path, emoticon)
  hasher = load_library(path)
  meaning = hasher["get_meaning"][emoticon]
  if meaning == nil
    meaning = "Sorry, that emoticon was not found"
  end 
  return meaning 
end
  