json.array!(@device_table_mappings) do |device_table_mapping|
  json.extract! device_table_mapping, :id, :device_id, :device_name, :table_number
  json.url device_table_mapping_url(device_table_mapping, format: :json)
end
