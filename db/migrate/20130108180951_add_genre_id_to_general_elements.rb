class AddGenreIdToGeneralElements < ActiveRecord::Migration
  def change
    add_column :general_elements, :genre_id, :integer
  end
end
