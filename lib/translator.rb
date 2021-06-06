require 'yaml'

# Write a method that loads the emoticons.yml file.
def load_library(path)
 emoticons = YAML.load_file(path)

  final_emoticons = emoticons.each_with_object({}) do |(key,value), final_hash|
    value.each do |mixed_emoji|
      if !final_hash[key]
        final_hash[key] = { }
      end
      if !final_hash[mixed_emoji] && emoticons[key].find_index(mixed_emoji) < 1
        final_hash[key][:english] = mixed_emoji
      end
      if !final_hash[mixed_emoji] && emoticons[key].find_index(mixed_emoji) >= 1
        final_hash[key][:japanese] = mixed_emoji
      end
    end
  end
end

# get japanese meaning:
# accepts two arguments, the YAML file path and the emoticon
# calls on #load_library and gives it the argument of the file path
# returns the Japanese equivalent of an English emoticons

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path) #call load_library
  result = emoticons["get_emoticon"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end
def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  result = emoticons["get_meaning"][emoticon] #the same above but change get_meaning
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end