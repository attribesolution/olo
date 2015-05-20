collection @categories, :object_root => false
attributes :id, :name, :created_at, :updated_at

category = "image"

node category do |c|
  @base_url + c.image.url unless c.image.url.nil?
end
