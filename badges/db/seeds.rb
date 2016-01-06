# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
students = ["Andrew Blum", "CJ", "Danielle Cameron", "Daniel Woznicki", "Eric Dell'Aringa", "Paul Gaston", "Kai Huang", "Joe Marion", "Jeremy Powell", "Kim Allen", "Kyle Smith", "Armani Saldana", "Pete Wiebe", "Steven Broderick", "Isaac Lee", "Nicole Yee"]

students.each do |student|
	Person.create(name: student)
end

Badge.create(
	title: "badass",
	points: 14,
	owner_id: 16
	)