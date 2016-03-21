
InventoryItem.create(
    label: 'Crestor',
    expiration_date: (Date.today + 2.months),
    type: 'Cholesterol',
    location: 'SEA_WAREHOUSE'
  )
InventoryItem.create(
    label: 'Seretide',
    expiration_date: (Date.today + 1.months),
    type: 'Asthma',
    location: 'PDX_WAREHOUSE'
  )
InventoryItem.create(
    label: 'OxyContin',
    expiration_date: (Date.today + 4.months),
    type: 'Pain',
    location: 'SEA_WAREHOUSE'
  )
InventoryItem.create(
    label: 'EXPIRED Test Drug',
    expiration_date: (Date.today - 1.month),
    type: 'Expired',
    location: 'SEA_WAREHOUSE'
  )