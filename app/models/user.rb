class User < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  has_many   :matches_b,
             :class_name => "Match",
             :dependent => :destroy

  has_many   :matches_a,
             :class_name => "Match",
             :foreign_key => "other_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
