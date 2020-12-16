class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        # #  validates :password, format: { with: 正規表現, message: 'エラー文' }
           
           validates :email, presence: true,uniqueness: true

           with_options presence: true do
            validates :nickname
            validates :birth_day
           end

           validates :password, presence: true,length: { minimum: 5 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

           with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
            validates :family_name
            validates :first_name
           end

           with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do 
            validates :family_name_kana
            validates :first_name_kana
           end
         


end
