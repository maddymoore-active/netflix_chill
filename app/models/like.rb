class Like < ApplicationRecord
  # Direct associations

  belongs_to :show

  belongs_to :user

  # Indirect associations

  # Validations

end
