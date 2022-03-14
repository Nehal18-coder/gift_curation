class AddPostcardCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :postcards_count, :integer
  end
end
