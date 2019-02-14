# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
for i in 1..50
  name = Faker::Name.name
  email = Faker::Internet.free_email(name)

  user = User.new
  user.name = name
  user.email = email
  if user.save

    Article.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user: user)

  end
end


for ii in 1..Article.count

  article = Article.find(ii)
  user = User.find(ii)

  for iii in 1..10
    Comment.create(message: Faker:: Lorem.paragraph, user: user, article: article)
  end
end