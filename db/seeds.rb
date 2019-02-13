# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..50
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph

  article = Article.new
  article.title = title
  article.content = content
  article.save
end

for i in 1..50
  name = Faker::Name.name
  email = Faker::Internet.free_email(name)

  user = User.new
  user.name = name
  user.email = email
  if user.save
    for ii in 1..Article.count

      article = Article.find(ii)

      for iii in 1..10
        comment = Comment.new
        comment.message = Faker::Lorem.paragraph
        comment.user = user
        comment.article = article
        comment.save
      end
    end
  end
end