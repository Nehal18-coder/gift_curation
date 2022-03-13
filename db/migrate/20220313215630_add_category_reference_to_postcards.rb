class AddCategoryReferenceToPostcards < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :postcards, :categories
    add_index :postcards, :category_id
    change_column_null :postcards, :category_id, false
  end
end
