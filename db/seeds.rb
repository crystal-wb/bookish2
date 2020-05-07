# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
date = Time.current.strftime('%Y-%m-%d')
sarah = {
          title: "Gettings Sarah",
          description: "things get weird when aliens arrive",
          date: date,
          author: "System Test",
          genre: "Sci-Fi",
          url: 'sarah/hello'
        }
zachary = {
            title: "Zachary's Purpose",
            description: "Work in progress",
            date: date,
            author: "Crystal Williams-Brown",
            genre: "Sci-Fi",
            url: 'zachary/prologue'
          }
book1 = Book.find_or_create_by(sarah)
book1.cover_photo = File.open('public/prototype temp files/Crab_Nebula_in_Taurus.jpg')
book1.save
book2 = Book.find_or_create_by(zachary)
book2.cover_photo = File.open('public/prototype temp files/orange-brush-strokes-background.jpg')
book2.save