class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :username, :string
  attribute :password, :string
  attribute :birthday, :date
  attribute :interests, :string
  attribute :address, :string
  attribute :category_id, :integer
  attribute :postcard_id, :integer

  # Direct associations

  has_many   :bookmarks

  # Indirect associations

end
