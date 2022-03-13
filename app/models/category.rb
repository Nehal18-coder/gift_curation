class Category < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :type_of_postcard, :inclusion => { :in => [ "Travel", "Music", "Art", "Inspiration" ]  }

  # Scopes

  def to_s
    type_of_postcard
  end

end
