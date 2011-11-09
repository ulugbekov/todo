# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
user=['admin@me.com','example1@me.com','example2@me.com','example3@me.com']
user.each do |user|
User.create!(:email=>user, :password=>"secret")
end
