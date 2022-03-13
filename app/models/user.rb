class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :interests, :inclusion => { :in => [ "Travel", "Music", "Art", "Inspiration" ]  }

  # Scopes

  def to_s
    username
  end

end
