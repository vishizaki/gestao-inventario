# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deletando matérias primas..."
RawMaterial.delete_all

puts "Criando matérias primas..."
RawMaterial.create!(name: "Ferro", quantity: 40)
RawMaterial.create!(name: "Parafuso", quantity: 400)
RawMaterial.create!(name: "Aço", quantity: 50)
RawMaterial.create!(name: "Rosca", quantity: 300)
