# メインのサンプルユーザーを1人作成する
User.create!(full_name:  "Example User",
             user_name: "Exuser",
             password:              "foobar",
             password_confirmation: "foobar")

# 追加のユーザーをまとめて生成する
30.times do |n|
  full_name  = Faker::Name.name
  user_name = Faker::Name.name
  password = "password"
  User.create!(full_name:  full_name,
               user_name: user_name,
               password:              password,
               password_confirmation: password)
end               
               
# 以下のリレーションシップを作成する
users = User.all
user  = users.first
following = users[2..10]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }               