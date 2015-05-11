json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :price, :description, :category_id
  json.url menu_url(menu, format: :json)
end
