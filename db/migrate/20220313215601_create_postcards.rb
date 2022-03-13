class CreatePostcards < ActiveRecord::Migration[6.0]
  def change
    create_table :postcards do |t|
      t.string :postcard_image
      t.text :postcard_name
      t.text :description
      t.string :price
      t.string :delivery_time
      t.integer :category_id
      t.integer :bookmark_id
      t.integer :user_id

      t.timestamps
    end
  end
end
