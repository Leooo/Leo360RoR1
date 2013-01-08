class CreateTaxoNationalities < ActiveRecord::Migration
  def change
    create_table :taxo_nationalities do |t|
      t.string :nationality

      t.timestamps
    end
  end
end
