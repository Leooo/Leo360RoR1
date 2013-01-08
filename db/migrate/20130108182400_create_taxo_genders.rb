class CreateTaxoGenders < ActiveRecord::Migration
  def change
    create_table :taxo_genders do |t|
      t.string :gender

      t.timestamps
    end
    add_index :taxo_genders, :gender, unique: true
  end
end
