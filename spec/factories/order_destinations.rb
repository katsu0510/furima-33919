FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '12345678901' }

    token {"tok_abcdefghijk00000000000000000"}
    item_id { 1 }
    user_id { 1 }
    
  end
end
