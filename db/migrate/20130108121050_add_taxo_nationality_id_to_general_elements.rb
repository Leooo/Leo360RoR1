class AddTaxoNationalityIdToGeneralElements < ActiveRecord::Migration
  def change
    add_column :general_elements, :taxo_nationality_id, :integer
  end
end
