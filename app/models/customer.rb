class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  enum gender:{
    man:     0, #男
    woman:   1, #女
  }
  
  attachment :image
  
  
   has_many :reviews, dependent: :destroy
   has_many :matchings, dependent: :destroy
  
       
end
