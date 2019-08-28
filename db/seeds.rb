require 'faker'

images = ['https://images.unsplash.com/reserve/wrev1ljvQ6KlfyljCQG0_lion.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1474314170901-f351b68f544f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60']

if Rails.env.development?
  puts 'Cleaning up database'
  User.destroy_all
  Animal.destroy_all
end

puts 'Creating user...'

User.create!(
  email: 'user@gmail.com',
  password: '123456'
  )

puts 'Creating animals...'

animal_names = []
animal_species = ['dog', 'cat', 'lion', 'spider', 'unicorn']
3.times { animal_names << Faker::Creature::Animal.name }
animal_names.uniq.each do |name|
  @animal = Animal.new(
    name: name.capitalize,
    species: animal_species.sample,
    price: rand(50...200),
    description: Faker::Lorem.paragraph
    )
  @animal.remote_photo_url = images.sample
  @animal.save!
end

puts "Completed #{User.count} user(s) and #{Animal.count} animals!"
