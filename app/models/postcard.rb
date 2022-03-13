class Postcard < ApplicationRecord
  mount_base64_uploader :postcard_image, PostcardImageUploader

  # Direct associations

  belongs_to :category

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
