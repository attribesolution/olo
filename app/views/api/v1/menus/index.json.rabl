collection @menus, :object_root => false
attributes :id, :name, :price, :description, :category_id, :created_at, :updated_at

child :menu_images, :root => "images", :object_root => false do
  attributes :id, :created_at, :updated_at
  
  menu_image = "url"

  node menu_image do |m|
    @base_url + m.image.url unless m.image.url.nil?
  end

end