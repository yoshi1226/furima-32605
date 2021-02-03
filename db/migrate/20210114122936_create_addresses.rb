class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string    :postal_code,     null: false
      t.integer   :delivery_area_id,   null: false
      t.string    :city,            null: false
      t.string    :addresses,       null: false
      t.string    :building
      t.string    :phone_number,    null: false
      # t.references :purchase_record, null: false, foreign_key: true
    end
  end
end
