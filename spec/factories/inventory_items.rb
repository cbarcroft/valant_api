FactoryGirl.define do
  
  factory :inventory_item do
    sequence(:label) { |n| "Test Drug #{n}" }
    expiration_date (Date.today + 1.month)
    type 'Test Drug'
    location 'SEA_WAREHOUSE'
  end

  factory :expired_item, class: InventoryItem do
    sequence(:label) { |n| "EXPIRED Test Drug #{n}" }
    expiration_date (Date.today - 1.month)
    type 'Expire Test'
    location 'PDX_WAREHOUSE'
  end
end
