class AddUserReferenceToPostcards < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :postcards, :users
    add_index :postcards, :user_id
  end
end
