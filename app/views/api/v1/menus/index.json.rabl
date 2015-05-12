collection @menus, :object_root => false
attributes :id, :name, :price, :description

child :menu_images, :root => "images", :object_root => false do
  attributes :id
  
  menu_image = "url"

  node menu_image do |m|
    m.image.url
  end

end