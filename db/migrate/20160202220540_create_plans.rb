class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :user_id
      t.text :title
      t.integer :total

      t.timestamps null: false
    end
  end
end
