class PurchaseManagement 

  has_one :user_address
  belongs_to :item
  belongs_to :user

  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city,:address, :building_name , :phone_number, :purchase_management
 



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_area


  

  
end

