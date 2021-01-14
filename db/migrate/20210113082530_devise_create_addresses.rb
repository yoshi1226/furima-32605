# frozen_string_literal: true

class DeviseCreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      ## Database authenticatable
      t.string    :postal_code,     null: false
      t.integer   :prefecture_id,   null: false
      t.string    :city,            null: false
      t.string    :addresses        null: false
      t.string    :building
      t.string    :phone_number,    null: false
      t.reference :purchase_record, null: false, foreign_key: true

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :addresses, :email,                unique: true
    add_index :addresses, :reset_password_token, unique: true
    # add_index :addresses, :confirmation_token,   unique: true
    # add_index :addresses, :unlock_token,         unique: true
  end
end
