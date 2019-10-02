require 'faker'

images = ['https://images.unsplash.com/reserve/wrev1ljvQ6KlfyljCQG0_lion.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1474314170901-f351b68f544f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1484557985045-edf25e08da73?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60']

if Rails.env.development?
  puts 'Cleaning up database'
  User.destroy_all
  Animal.destroy_all
  Review.destroy_all
end

puts 'Creating user...'

User.create!(
  email: 'user@gmail.com',
  password: '123456'
  )

User.create!(
  email: 'user@user.com',
  password: '123456'
  )

puts 'Creating animals...'

@koala = Animal.new(
  remote_photo_url: 'https://images.unsplash.com/photo-1459262838948-3e2de6c1ec80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  name: 'Oliver',
  species: 'koala',
  price: 180,
  description: 'Oliver is great for anybody who suffers from JS or just needs a hug. We\'ll promise that you\'ll have a great time with him!',
  address: '217 Glen Eira Rd, St Kilda East VIC 3183',
  user_id: User.first.id
  )

@koala.save!

@lion = Animal.new(
  remote_photo_url: 'https://images.unsplash.com/photo-1503624886539-b1355ee1a745?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  name: 'Simba',
  species: 'lion',
  price: 250,
  description: 'Simba is our beautiul lion, perfect for you if you want to gain a new perspective on life.',
  address: '306 Glen Huntly Rd, Elsternwick VIC 3185',
  user_id: User.first.id
  )

@lion.save!

@dog = Animal.new(
  remote_photo_url: 'https://images.unsplash.com/photo-1513904178077-6c5730ddd446?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
  name: 'Charlie',
  species: 'dog',
  price: 100,
  description: 'Feeling down and depressed? Book my Charlie to cheer you up!',
  address: '19 Sandham St, Elsternwick VIC 3185',
  user_id: User.first.id
  )

@dog.save!

@horse = Animal.new(
  remote_photo_url: 'https://images.unsplash.com/photo-1511825869128-e85768033761?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  name: 'Flah',
  species: 'horse',
  price: 500,
  description: 'Need more magic in your life? Click down below and you\'ll be on the right way',
  address: '481 Glen Huntly Rd, Elsternwick VIC 3185',
  user_id: User.last.id
  )

@horse.save!

@cat = Animal.new(
  remote_photo_url: 'https://images.unsplash.com/photo-1511044568932-338cba0ad803?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
  name: 'Miez',
  species: 'cat',
  price: 300,
  description: 'Need some cuddles and warmth? Miez will be the cat for you!',
  address: '34-44 Regent St, Elsternwick VIC 3185',
  user_id: User.last.id
)

@cat.save!

puts 'Creating reviews...'

@review_first = Review.new(
  description: 'Lovely encounter! Definitely helped me with my anxiety and depression after I got chlamydia from this experience I booked on Airsperience...',
  rating: 4,
  animal_id: Animal.first.id
  )

@review_first.save!

@review_second = Review.new(
  description: 'Hated it! He bit me and I had to go to the hospital afterwards! On top, I didn\'t get a refund!',
  rating: 1,
  animal_id: Animal.first.id
  )

@review_second.save!

@review_third = Review.new(
  description: 'So much fun! I wasn\'t even depressed, just wanted to try it out! Very recommendable!',
  rating: 5,
  animal_id: Animal.last.id
  )

@review_third.save!

puts "Completed #{User.count} users, #{Animal.count} animals, and #{Review.count} reviews!"
