if Rails.env.development?
  puts 'Cleaning up database'
  User.destroy_all
end

puts 'Creating user...'

User.create!(
  email: 'user@gmail.com',
  password: '123456'
  )

puts "Completed #{User.count} user(s)!"
