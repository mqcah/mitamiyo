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
                  email: "test@mail",
                  password: "password",
                  )
Customer.create!(
                  customer_status: "true",
                  user_id: "mitamiyo2",
                  customer_name: "ミタミヨ2",
                  profile: "ホラー系の映画が好きな学生です",
                  image_id: "",
                  email: "test2@mail",
                  password: "password",
                  )

genre_names = [
                'アクション',
                'ホラー',
                'ロマンス',
                'サスペンス',
                'SF',
                'ミステリー',
                'ファンタジー',
                'アニメ',
                'ドラマ',
                '音楽',
                ]

genre_names.each do |genre_name|
  Genre.create!(
    name: genre_name,
  )
end