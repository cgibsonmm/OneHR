require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@admin1 = User.find_by(email: 'admin@admin.com')
@admin1&.destroy
@admin1 = User.create!(email: 'admin@admin.com', password: '1234567', password_confirmation: '1234567', role: 'admin')

30.times do
  Requisition.create!(title: Faker::Company.profession,
                      department: Faker::Company.industry,
                      full_time: Faker::Boolean.boolean,
                      preferred_start_date: Faker::Date.between(from: 2.weeks.from_now, to: 1.year.from_now),
                      job_description: Faker::Lorem.paragraphs(number: 3, supplemental: true).join('/n'),
                      user: @admin1)
end
