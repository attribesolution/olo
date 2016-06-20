class ChangeNameAndImageColumnDefaultValue < ActiveRecord::Migration
  def change
  	change_column :categories, :image, :string, default: nil, null: true
  	change_column :categories, :name, :string, default: nil, null: true
  end
end
