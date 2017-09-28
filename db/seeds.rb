# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
t1 = Category.create(name: "Community", description: "Items of interest to the community")
SubCategory.create(name: "Artists", description: "Items about artists", category_id: t1.id)
SubCategory.create(name: "Childcare", description: "Childcare related items", category_id: t1.id)

t2 = Category.create(name: "For sale", description: "Items for sale")
SubCategory.create(name: "Antiques", description: "Antiques for sale", category_id: t2.id)
SubCategory.create(name: "Bikes", description: "Bikes for sale", category_id: t2.id)
SubCategory.create(name: "Boats", description: "Boats for sale", category_id: t2.id)

t3 = Category.create(name: "Resumes", description: "Resumes of people looking for work")

t4 = Category.create(name: "Events", description: "Events of interest")

t5 = Category.create(name: "Gigs", description: "Gigs wanted and needed")
SubCategory.create(name: "Computer gigs", description: "Computer related gigs", category_id: t5.id)
SubCategory.create(name: "Labor gigs", description: "Labor related gigs", category_id: t5.id)
SubCategory.create(name: "Writing gigs", description: "Writing related gigs", category_id: t5.id)

t6 = Category.create(name: "Housing", description: "Housing available")

t7 = Category.create(name: "Jobs", description: "Jobs looking to fill")

t8 = Category.create(name: "Personals", description: "Situations wanted")

t9 = Category.create(name: "Services", description: "Services wanted and needed")
