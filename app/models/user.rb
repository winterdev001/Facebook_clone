class User < ApplicationRecord
    has_many :posts
    
    validates :first_name, presence: true, length: {maximum: 30}
    validates :last_name, presence: true, length: {maximum: 30}
    validates :email_or_phone, presence: true, length: {maximum: 255}, 
                      format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation {email_or_phone.downcase!}
    has_secure_password
    validates :password,:password_confirmation, presence: true, length: {minimum: 6}  
    validates :date, presence: true
    validates :gender, presence: true
end
