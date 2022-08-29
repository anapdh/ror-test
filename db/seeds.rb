users = [
  { email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true },
  { email: 'guest@example.com', password: 'password', password_confirmation: 'password', admin: false }
]

users.each do |user|
  User.create(user)
end

contacts = [
  { name: 'Provider1', contact_type: 'Provider', email: 'abc@example.com' },
  { name: 'Client1', contact_type: 'Client', email: 'dfg@example.com' }
]

contacts.each do |contact|
  Contact.create(contact)
end

properties = [
  { name: 'Property1', plantation_area: 100, plants_row_spacing: 2, plants_column_spacing: 2, contact_id: 1,
    plants_attributes: [{ name: 'Lettuce'}]
  },
  { name: 'Property2', plantation_area: 200, plants_row_spacing: 3, plants_column_spacing: 3, contact_id: 1,
  plants_attributes: [{ name: 'Rice'}]
  },
  { name: 'Property3', plantation_area: 300, plants_row_spacing: 4, plants_column_spacing: 4, contact_id: 1 ,
  plants_attributes: [{ name: 'Corn'}]
  }
]

properties.each do |property|
  Property.create(property)
end