class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :address
      t.text :description
      t.string :city
      t.string :name
      t.integer :price_by_day
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
