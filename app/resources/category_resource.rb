class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :type_of_postcard, :string

  # Direct associations

  has_many :postcards

  # Indirect associations
end
