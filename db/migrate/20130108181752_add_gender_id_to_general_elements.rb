class AddGenderIdToGeneralElements < ActiveRecord::Migration
  def change
    add_column :general_elements, :gender_id, :integer
  end
end
