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

@lion = Animal.new(
  remote_photo_url: 'https://images.unsplash.com/reserve/wrev1ljvQ6KlfyljCQG0_lion.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  name: 'Simba',
  species: 'lion',
  price: 250,
  description: 'Simba is our beautiul lion, perfect for you if you want to gain a new perspective on life.',
  user_id: User.last.id
  )

@lion.save!

@dog = Animal.new(
  remote_photo_url: 'https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  name: 'Charlie',
  species: 'dog',
  price: 100,
  description: 'Feeling down and depressed? Book my Charlie to cheer you up!',
  user_id: User.last.id
  )

@dog.save!

@unicorn = Animal.new(
  remote_photo_url: 'https://images.unsplash.com/photo-1562037283-072818fb6d8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  name: 'Flah',
  species: 'unicorn',
  price: 500,
  description: 'Need more magic in your life? Click down below and you\'ll be on the right way',
  user_id: User.last.id
  )

@unicorn.save!


# animal_names = []
# animal_species = ['dog', 'cat', 'lion', 'spider', 'unicorn']
# 3.times { animal_names << Faker::Creature::Animal.name }
# animal_names.uniq.each do |name|
#   @animal = Animal.new(
#     name: name.capitalize,
#     species: animal_species.sample,
#     price: rand(50...200),
#     description: Faker::Lorem.paragraph,
#     user_id: User.last.id
#     )
#   @animal.remote_photo_url = images.sample
#   @animal.save!
# end

puts "Completed #{User.count} user(s) and #{Animal.count} animals!"
