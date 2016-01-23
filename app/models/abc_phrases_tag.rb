class AbcPhrasesTag < ActiveRecord::Base
  belongs_to :abc_phrase, class_name: "AbcPhrase"
  belongs_to :tag,        class_name: "Tag"
end
