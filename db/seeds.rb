# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(
                  customer_status: "true",
                  user_id: "mitamiyo",
                  customer_name: "ミタミヨ",
                  profile: "アクション系の映画が好きな主婦です",
                  image_id: "",
                  email: "test@test.jp",
                  password: "password",
                  )