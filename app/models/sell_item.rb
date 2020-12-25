class SellItem

  
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city,:address, :building_name ,:phone_number, :user_id,:item_id,:token
 
  with_options presence: true do
    validates :city
    validates :address
    validates :token
  end

  validates :delivery_area_id,presence: true,numericality: { other_than: 1 }
  validates :postal_code,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :phone_number,format: { with: /\A0[0-9]+\z/, message: 'number is invalid. Include half-width numbers' } 


  def save
    
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    UserAddress.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address: address, building_name: building_name,phone_number: phone_number,purchase_management_id: purchase_management.id)
  end

 
  
end

