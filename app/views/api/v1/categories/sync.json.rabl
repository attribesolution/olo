collection @categories, :object_root => false
attributes :id, :name, :created_at, :updated_at, :uuid

node(:image) { |category| category.image unless category.image.nil? }

child :active_menus, :object_root => false do
  attributes :id, :name, :price, :description, :category_id, :created_at, :updated_at, :approved, :uuid, :sort_order

  child :menu_images, :root => "images", :object_root => false do
    attributes :id, :created_at, :updated_at
    
    menu_image = "url"

    node menu_image do |m|
      m.image unless m.image.nil?
    end
  end
end