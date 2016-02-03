class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :plan_id
      t.integer :amount
      t.boolean :complete, default: false
      t.date :payment_date
      t.integer :increment

      t.timestamps null: false
    end
  end
end
