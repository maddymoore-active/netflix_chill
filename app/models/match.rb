class Match < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :other,
             :class_name => "User"

  # Indirect associations

  # Validations

end
