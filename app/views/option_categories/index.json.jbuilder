json.array!(@option_categories) do |option_category|
  json.extract! option_category, :id, :name, :user_id, :multiple_choice, :required
  json.url option_category_url(option_category, format: :json)
end
