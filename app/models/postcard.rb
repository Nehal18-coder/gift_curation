class Postcard < ApplicationRecord
  mount_base64_uploader :postcard_image, PostcardImageUploader

  # Direct associations

  belongs_to :category,
             optional: true

  belongs_to :user,
             optional: true,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
