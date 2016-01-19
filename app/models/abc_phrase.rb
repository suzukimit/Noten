class AbcPhrase < ActiveRecord::Base
  belongs_to :user
  validates :user_id,   presence: true
  validates :tytle,     presence: true, length: {maximum: 100}
  validates :meter,     presence: true
  validates :length,    presence: true
  validates :reference,                 length: {maximum: 200}
  validates :key,       presence: true
  validates :abc,       presence: true, length: {maximum: 10000}
end
