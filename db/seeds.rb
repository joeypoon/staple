# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

36.times do

  user = User.create(username: Faker::Internet.user_name,
                     email: Faker::Internet.email,
                     password: 'password',
                     password_confirmation: 'password')

  Post.create(url: Faker::Internet.url,
              remote_photo_url: Faker::Avatar.image,
              notes: Faker::Lorem.sentence,
              user_id: user.id)

end
