class PriceForProduct < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal, null: false
  end
end
