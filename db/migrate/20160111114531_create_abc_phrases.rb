class CreateAbcPhrases < ActiveRecord::Migration
  def change
    create_table :abc_phrases do |t|
      t.references :user, index: true, foreign_key: true
      t.string :tytle
      t.string :meter
      t.string :length
      t.string :reference
      t.string :key
      t.string :abc

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
