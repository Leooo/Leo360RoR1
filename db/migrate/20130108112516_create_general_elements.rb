class CreateGeneralElements < ActiveRecord::Migration
  def change
    create_table :general_elements do |t|
      t.string :nationality
      t.string :gender
      t.integer :feedback_filled_id

      t.timestamps
    end
  end
end
