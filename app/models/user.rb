class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true

  has_attached_file :avatar, :styles => {medium: "300x300", small: "150x150"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_one :diary
  has_many :notes

end
