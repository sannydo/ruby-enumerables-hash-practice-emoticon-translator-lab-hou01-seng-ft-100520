require "yaml"
require "pry"
# require modules here

def load_library(path)
  emoticons = YAML.load_file('lib/emoticons.yml')
  emoticon_hash = {}
  emoticons.each do |feelings, characters|
   emoticon_hash[feelings] ||= {}
   emoticon_hash[feelings][:english] = characters[0]
   emoticon_hash[feelings][:japanese] = characters[1]
 end
emoticon_hash
end

#new code below
def get_japanese_emoticon(path, emoticon)
  load_library(path).each do |key, value|
    if value[:english]
      return key
    end
  end
    return "Sorry, that emoticon was not found"
end


#new code below
def get_english_meaning(path, emoticon)
  load_library(path).each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
    return "Sorry, that emoticon was not found"
end