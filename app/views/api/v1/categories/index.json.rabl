collection @categories, :object_root => false
attributes :id, :name, :created_at, :updated_at, :uuid

category = "image"

node category do |c|
  c.image unless c.image.nil?
end
