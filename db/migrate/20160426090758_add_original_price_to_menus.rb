class AddOriginalPriceToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :original_price, :float
  end
end
