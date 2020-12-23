class Item < ApplicationRecord

    belongs_to :user
    has_one :purchase_management
    has_one_attached :image
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_area
    belongs_to :delivery_day
    belongs_to :delivery_fee
  
    with_options presence: true do
      validates :name
      validates :description
      validates :image
    end
    validates :price, presence: true,numericality: {greater_than:299, less_than:10000000, with: /\A[0-9]+\z/}

    with_options presence: true,numericality: { other_than: 1 }  do 
      validates :category_id 
      validates :condition_id
      validates :delivery_area_id
      validates :delivery_fee_id
      validates :delivery_day_id
    end

end
