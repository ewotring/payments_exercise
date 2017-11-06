class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :payment_amount, scale: 2
      t.integer :loan_id

      t.timestamps null: false
    end
  end
end
