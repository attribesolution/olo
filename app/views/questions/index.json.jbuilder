json.array!(@questions) do |question|
  json.extract! question, :id, :question, :restaurant_owner_id
  json.url question_url(question, format: :json)
end
