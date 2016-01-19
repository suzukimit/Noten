class ChangeDatatypeAbcOfAbcPhrases < ActiveRecord::Migration
  def change
    change_column :abc_phrases, :abc, :text
  end
end
