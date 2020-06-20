require 'yaml'

def load_library(file_path)
   
    emoticons = YAML.load_file(file_path)
    emoticon_hash = {}
      emoticon_hash["get_meaning"] = {}
      emoticon_hash["get_emoticon"] = {}
    emoticons.each do |meaning, emoticon_set|
      emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
      emoticon_hash["get_meaning"][emoticon_set.last] = meaning
    end
   
    emoticon_hash

end

def get_japanese_emoticon(file_path, emoticon)
    
    emoticon_hash = load_library(file_path)
    result = emoticon_hash["get_emoticon"][emoticon]
        if result == nil
            result = "Sorry, that emoticon was not found"
        end
   
    result

end

def get_english_meaning(file_path, emoticon)
    
    emoticon_hash = load_library(file_path)
    result = emoticon_hash["get_meaning"][emoticon]
        if result == nil
            result = "Sorry, that emoticon was not found"
        end
    
    result
    
end