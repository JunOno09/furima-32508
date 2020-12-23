class PurchaseManagement 

  has_one :user_address
  belongs_to :item
  belongs_to :user

  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city,:address, :building_name , :phone_number, :purchase_management
 
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
  end

  validates :delivery_area_id,presence: true,numericality: { other_than: 1 }
  


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_area

  def save
    UserAddress.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address: address, building_name: building_name,user_id: user.id,item_id: item.id)
  end

  

  
end

