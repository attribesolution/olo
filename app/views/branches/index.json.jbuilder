json.array!(@branches) do |branch|
  json.extract! branch, :id, :name, :code, :address, :phone
  json.url branch_url(branch, format: :json)
end
