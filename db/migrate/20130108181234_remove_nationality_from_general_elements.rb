class RemoveNationalityFromGeneralElements < ActiveRecord::Migration
  def up
    remove_column :general_elements, :nationality, :string
  end

  def down
    add_column :general_elements, :nationality, :string
  end
end
