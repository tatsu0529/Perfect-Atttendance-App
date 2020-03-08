# coding: utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             affiliation: "上長",
             employee_number: "1",
             uid: "1",
             admin: true)
             
60.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  employee_number = "#{n+1}"
  uid = "#{n+1}"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               affiliation: "freelance",
               employee_number: employee_number,
               uid: uid)
end