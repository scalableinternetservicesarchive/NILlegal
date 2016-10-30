# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(name:  "Example User One",
             email: "foo@bar.org",
             password:              "foobar",
             password_confirmation: "foobar")
             
user2 = User.create!(name:  "Example User Two",
             email: "bar@foo.org",
             password:              "foobar",
             password_confirmation: "foobar")
             
             
dare = user1.dares.create(title: "Test", description: "Test dare")

dare_sub = dare.dare_submissions.build(content: "https://www.youtube.com/watch?v=dQw4w9WgXcQ", description: "Get Rick Rolled")

user2.dare_submissions << dare_sub