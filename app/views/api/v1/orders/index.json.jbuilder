json.array!(@orders) do |order|
  json.extract! order, :id, :table_no, :created_at, :updated_at, :order_details
end
