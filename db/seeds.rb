users = [
  { email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true },
  { email: 'guest@example.com', password: 'password', password_confirmation: 'password', admin: false }
]

users.each do |user|
  User.create(user)
end