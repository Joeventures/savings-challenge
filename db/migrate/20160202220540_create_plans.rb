class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.text :title
      t.integer :total

      t.timestamps null: false
    end
  end
end
