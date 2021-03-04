FactoryBot.define do
  factory :pay do
    postal_code   {"000-0000"}
    prefecture_id {1}
    city          {"東京都"}
    addresses     {"1-1"}
    phone_number  {"00000000000"}
    user_id       {1}
    item_id       {1}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end