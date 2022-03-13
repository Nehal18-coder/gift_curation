class PostcardResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :postcard_image, :string
  attribute :postcard_name, :string
  attribute :description, :string
  attribute :price, :string
  attribute :delivery_time, :string
  attribute :category_id, :integer
  attribute :bookmark_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :category

  belongs_to :user

  # Indirect associations

end
