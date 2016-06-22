class AddUuidToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
