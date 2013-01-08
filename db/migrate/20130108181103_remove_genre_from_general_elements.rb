class RemoveGenreFromGeneralElements < ActiveRecord::Migration
  def up
    remove_column :general_elements, :genre, :string
  end

  def down
    add_column :general_elements, :genre, :string
  end
end
