class SellItem

  
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city,:address, :building_name ,:phone_number, :user_id,:item_id
 
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
  end

  validates :delivery_area_id,presence: true,numericality: { other_than: 1 }
  




  def save
    
    purchase_management = PurchaseManagement.create(user_id: user_id, item_id: item_id)
    UserAddress.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address: address, building_name: building_name,phone_number: phone_number,purchase_management_id: purchase_management.id)
  end

  
  # postal_code         | string     | null: false                    |
  # | delivery_area_id    | integer    | null: false                    |
  # | city                | string     | null: false                    |
  # | address             | string     | null: false                    |
  # | building_name       | string     |                                |
  # | phone_number   
  
end

