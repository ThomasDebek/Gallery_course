# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



user = Uzytkownik.create(imie:'dave', nazwisko:'debek', uzytkownik:'dave', email:'dave@gmail.com', telefon:'456456456', password:'secret', password_confirmation:'secret')
user.save
