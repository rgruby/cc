namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    50.times do |n|
      word = Faker::Lorem.words(1)[0]
      if word == 'cum' then word = 'manum' end
      name = word.capitalize
      image_url = "http://placehold.it/280x" + (150 + rand(4)*40).to_s + "/CCCCCC/000000&text=" + name
      link_url = "http://www.google.com/search?q=" + name
      post = Post.create!(name: name,
                        image_url: image_url,
                        link_url: link_url)

      rand(5).times do
        comment = post.comments.build(content: Faker::Lorem.sentences(rand(3) + 1).join(' '))
        comment.user = User.first
        comment.save
      end
    end
  end
end
