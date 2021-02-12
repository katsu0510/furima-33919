class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :state_id, null: false
      t.integer :ship_cost_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :ship_day_id, null: false
      t.references :user, null: false, foreignkey: true
      t.integer :price, null: false
      t.string :image,  null: false
      t.timestamps
    end
  end
end
