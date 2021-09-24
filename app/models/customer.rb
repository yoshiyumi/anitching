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
  
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("nicname LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("nicname LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("nicname LIKE?","%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("nicname LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end
  
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy 
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy 
  has_many :following_customer, through: :follower, source: :followed 
  has_many :follower_customer, through: :followed, source: :follower 

 
  def follow(cusromer_id)
    follower.create(followed_id: cusromer_id)
  end

 
  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end

 
  def following?(customer)
    following_customer.include?(customer)
  end
  
  has_many :reviews, dependent: :destroy
  has_many :matchings, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :works, dependent: :destroy
  has_many :comments, dependent: :destroy
       
end
