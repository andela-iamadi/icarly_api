# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User1 = User.create( username: "clark", password: "", first_name: "clark", last_name: "kent" )
User2 = User.create( username: "lois", password: "", first_name: "lois", last_name: "lane")
User3 = User.create( username: "bat", password: "", first_name: "bat", last_name: "man")

require 'pry'; binding.pry
User1.tasks << Task.create([
		{ task: "Build api", due_date: Date.today, due_time: Time.new + 1, alias: "api" },
		{ task: "Pass fizzbuzz", due_date: Date.today, due_time: Time.new + 6, alias: "pass" },
		{ task: "Check Tests", due_date: Date.today, due_time: Time.new + 60, alias: "test" }
	])
