class User < ApplicationRecord
  # Direct associations

  has_many   :postcards,
             dependent: :destroy

  has_many   :bookmarks,
             dependent: :destroy

  # Indirect associations

  # Validations

  validates :interests,
            inclusion: { in: ["Travel", "Music", "Art", "Inspiration"] }

  # Scopes

  def to_s
    username
  end
end
