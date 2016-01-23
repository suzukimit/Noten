class CreateAbcPhrasesTags < ActiveRecord::Migration
  def change
    create_table :abc_phrases_tags do |t|
      t.references :abc_phrase, index: true
      t.references :tag, index: true
      t.timestamps null: true
      t.index [:user_id, :tag_id], unique: true
    end
  end
end
