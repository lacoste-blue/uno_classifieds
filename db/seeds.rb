# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(:name => 'Community', :description => 'Items of interest to the community')

Category.create(:name => 'For sale', :description => 'Items for sale')

Category.create(:name => 'Resumes', :description => 'Resumes of people looking for work')

Category.create(:name => 'Events', :description => 'Events of interest')

Category.create(:name => 'Gigs', :description => 'Gigs wanted and needed')

Category.create(:name => 'Housing', :description => 'Housing available')

Category.create(:name => 'Jobs', :description => 'Jobs looking to fill')

Category.create(:name => 'Personals', :description => 'Situations wanted')

Category.create(:name => 'Services', :description => 'Services wanted and needed')
