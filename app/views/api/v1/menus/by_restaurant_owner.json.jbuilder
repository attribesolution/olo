json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :price, :description, :restaurant_owner_id, :created_at, :updated_at
end