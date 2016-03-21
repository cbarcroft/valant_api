json.array!(@inventory_items) do |inventory_item|
  json.extract! inventory_item, :id, :label, :type, :expiration_date, :location, :is_removed
end
