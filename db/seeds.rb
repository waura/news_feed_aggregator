# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Feed.create(
  title: "Sample",
  url: "http://www.feedforall.com/sample.xml",
  last_modified: Time.local(1970,1,1))

AdminUser.create!(email: 'sample@gmail.com', password: 'sample', password_confirmation: 'sample')
