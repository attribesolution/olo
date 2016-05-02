json.array!(@menu_options) do |menu_option|
  json.extract! menu_option, :id, :name, :price, :option_category_id
  json.url menu_option_url(menu_option, format: :json)
end
