class Tag < ActiveRecord::Base
  has_many :abc_phrases_tags, class_name: "AbcPhrasesTag", 
                              foreign_key: "abc_phrase_id", 
                              dependent: :destroy
end
