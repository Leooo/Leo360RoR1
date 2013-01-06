class CreateFeedbackFilleds < ActiveRecord::Migration
  def change
    create_table :feedback_filleds do |t|
      t.integer :profile_id
      t.integer :user_id

      t.timestamps
    end
    add_index :feedback_filleds, :profile_id
    add_index :feedback_filleds, :user_id
    add_index :feedback_filleds, [:profile_id,:user_id], unique: true
  end
end
