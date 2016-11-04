class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :dares, dependent: :destroy
  has_many :comments
  has_many :comment_likes
  has_many :submission_likes
  has_many :dare_submissions, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
