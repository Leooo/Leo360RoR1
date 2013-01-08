class RemoveGenreIdFromGeneralElements < ActiveRecord::Migration
 def up
    remove_column :general_elements, :genre_id, :integer
  end

  def down
    add_column :general_elements, :genre_id, :integer
  end
end
