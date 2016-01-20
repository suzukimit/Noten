class RenameColumnFromTytleToTitle < ActiveRecord::Migration
  def change
    rename_column :abc_phrases, :tytle, :title
  end
end
