namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user=User.new(name: "admin",
                 email: "admin@yahoo.fr",
                 password: "mpivsadmin",
                 password_confirmation: "mpivsadmin")
    user.toggle!(:admin)
    user.save!
    user=User.new(name: "Lionel Viet",
                 email: "viet_lionel@yahoo.fr",
                 password: "SOPHIA0",
                 password_confirmation: "SOPHIA0")
    user.save!

    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name=Faker::Name.name
      email="example-#{n+1}@railstutorial.org"
      password="password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
