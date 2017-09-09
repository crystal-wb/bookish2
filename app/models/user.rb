class User < ApplicationRecord
  has_many :story_saves, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "600x600>", thumb: "100x100>" }, default_url: "/prototype temp files/monkey_zombie.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
end
