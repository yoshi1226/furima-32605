FactoryBot.define do
  factory :item do
    association :user

    name                   {"a"}
    info                   {"説明"}
    category_id            {2}
    sales_status_id        {2}
    shopping_fee_status_id {2}
    prefecture_id          {2}
    scheduled_delivery_id  {2}
    price                  {300}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/computer_businessman1_smile.png'), filename: 'computer_businessman1_smile.png')
    end
  end
end