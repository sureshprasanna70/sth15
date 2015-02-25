class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :college ,presence:true
  validates :department,presence:true
  validates :name,presence:true
  validates :year,presence:true
  validates :phone ,presence:true,numericality:true

  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
