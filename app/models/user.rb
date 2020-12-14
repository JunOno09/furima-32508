class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :email, presence: true,uniqueness: true, format: with: (/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
         validates :encrypted_password, presence: true,length: { minimum: 5 }, format: with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)

         with_options presence: true, format: ( with: /\A[ぁ-んァ-ヶ一-龥々]+\z/)do
          validates :family_name, presence: true
          validates :first_name, presence: true
         end
         with_options presence: true, format: ( with: /\A[ァ-ヶー－]+\z/) do
          validates :family_name_kana, presence: true
          validates :first_name_kana, presence: true
         end
         validates :birth_day, presence: true


end
