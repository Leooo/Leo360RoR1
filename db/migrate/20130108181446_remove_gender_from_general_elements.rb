class RemoveGenderFromGeneralElements < ActiveRecord::Migration
  def up
    remove_column :general_elements, :gender, :string
  end

  def down
    add_column :general_elements, :gender, :string
  end
end
