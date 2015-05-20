collection @categories, :object_root => false
attributes :id, :name, :created_at, :updated_at

category = "image"

node category do |c|
  c.image.url
end
