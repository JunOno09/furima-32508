class PurchaseManagement < ApplicationRecord
has_one :user_address
belongs_to :item
belongs_to :user
end
