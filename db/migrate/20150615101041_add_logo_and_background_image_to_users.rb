class AddLogoAndBackgroundImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :logo, :string
    add_column :users, :background_image, :string
  end
end
