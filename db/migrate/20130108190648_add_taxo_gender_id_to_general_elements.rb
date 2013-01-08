class AddTaxoGenderIdToGeneralElements < ActiveRecord::Migration
  def change
    add_column :general_elements, :taxo_gender_id, :integer
  end
end
