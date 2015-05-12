collection @categories, :object_root => false
attributes :id, :name

category = "image"

node category do |c|
  c.image.url
end
