FactoryBot.define do
  factory :pay do
    postal_code   {"000-0000"}
    prefecture_id {2}
    city          {"東京都"}
    addresses     {"1-1"}
    building      {"test"}
    phone_number  {"00000000000"}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end