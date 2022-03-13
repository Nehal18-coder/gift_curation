class AddUserReferenceToPostcards < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :postcards, :users
    add_index :postcards, :user_id
    change_column_null :postcards, :user_id, false
  end
end
