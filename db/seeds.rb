# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Seeding...'

Parlor.create ([
  {
    name: 'Sweet Home Alabama',
    image_url: 'https://i.imgur.com/3dw1Vfv.jpg',
    description: 'All things Dixie'
  },
  {
    name: 'Concerts & Performances',
    image_url: 'https://i.imgur.com/1TDNIHr.jpg',
    description: 'Find the latest chatter on upcoming acts, bands, and performances'
  },
  {
    name: 'Sports Events & Tournaments',
    image_url: 'https://i.imgur.com/prU3E2S.jpg',
    description: 'Football, soccer, golf, track & field, pickleball??? Whatever you like.'
  },
  {
    name: 'The Beach',
    image_url: 'https://i.imgur.com/GPdvFEL.jpg',
    description: 'Share what/s going on at Orange Beach, Gulf Shores, Fort Morgan and other nearby beaches.'
  },
  {
    name: 'Fishing & Boating',
    image_url: 'https://i.imgur.com/b9DKaqy.jpg',
    description: 'Aye, aye, Skipper!'
  },
  {
    name: 'Shopping',
    image_url: 'https://imgur.com/V0air8j',
    description: 'How many ways can I spend money?!'
  },
  {
    name: 'Dining',
    image_url: 'https://i.imgur.com/HGBW6yy.jpg',
    description: 'Did someone say BBQ?'
  },
  {
    name: 'Amusement Parks & Attractions',
    image_url: 'https://i.imgur.com/xIj2rbM.jpg',
    description: 'When the beach isn/t enough'
  },

])

first_fan = Fan.create(username: 'Kaonashi', password: 'pw12345', password_confirmation: 'pw12345', image_url: 'https://i.imgur.com/PfNDeaw.jpg')
second_fan = Fan.create(username: 'Chihiro', password: 'pw12345', password_confirmation: 'pw12345', image_url: 'https://i.imgur.com/wYB9bkL.jpg')
third_fan = Fan.create(username: 'Yubaba', password: 'pw12345', password_confirmation: 'pw12345', image_url:'https://i.imgur.com/cuoTYYf.jpg')

first_parlor = Parlor.first
first_parlor.enrollments.create(fan: first_fan)
first_parlor.enrollments.create(fan: second_fan)
first_fan.messages.create(content: 'What in tarnation!.', parlor: first_parlor)
second_fan.messages.create(content: 'I do find this quite informative.', parlor: first_parlor)
first_fan.messages.create(content: 'こんな場所があるとは知りませんでした。', parlor: first_parlor)

second_parlor = Parlor.second
second_parlor.enrollments.create(fan: first_fan)
second_parlor.enrollments.create(fan: third_fan)
first_fan.messages.create(content: 'Vamos a la playa. ', parlor: second_parlor)
first_fan.messages.create(content: 'Don Quixote y Sancho Panza no estan aqui', parlor: second_parlor)
first_fan.messages.create(content: '¿Adonde vas?', parlor: second_parlor)


third_parlor = Parlor.third
third_parlor.enrollments.create(fan: second_fan)
third_parlor.enrollments.create(fan: third_fan)
second_fan.messages.create(content: 'Does this guy have a job?', parlor: third_parlor)
second_fan.messages.create(content: 'Dunno', parlor: third_parlor)
second_fan.messages.create(content: 'Throw him a bone', parlor: third_parlor)
puts 'Seeding Complete'