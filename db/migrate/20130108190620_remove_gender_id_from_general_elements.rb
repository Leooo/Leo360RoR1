class RemoveGenderIdFromGeneralElements < ActiveRecord::Migration
 def up
    remove_column :general_elements, :gender_id, :integer
  end

  def down
    add_column :general_elements, :gender_id, :integer
  end
end
