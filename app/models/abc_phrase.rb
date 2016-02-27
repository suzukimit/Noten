class AbcPhrase < ActiveRecord::Base
  belongs_to :user
  validates :user_id,   presence: true
  validates :title,     presence: true, length: {maximum: 100}
  validates :meter,     presence: true
  validates :length,    presence: true
  validates :reference,                 length: {maximum: 200}
  validates :key,       presence: true
  validates :abc,       presence: true, length: {maximum: 10000}
  has_many :abc_phrases_tags, class_name: "AbcPhrasesTag", 
                              foreign_key: "abc_phrase_id", 
                              dependent: :destroy
  has_many :tags, through: :abc_phrases_tags, source: :tag
  accepts_nested_attributes_for :tags, allow_destroy: true
end
