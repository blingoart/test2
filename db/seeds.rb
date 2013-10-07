# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Client.create(name:'Live')
#App.create(name:'Live', api_password:'test123', thumbnail_sticker_width:30, thumbnail_sticker_height:30, actual_sticker_width:60, actual_sticker_height:60, percentage_of_revenue:30)
#Artist.create(first_name:'John', last_name:'Smith', percentage_of_revenue:60)
# OnboardingArtist.create(first_name:'John', last_name:'Smith', signin_name:'johnsmith', password_digest:'$2a$10$Ula1qV8HJqB7l1UBdDXcb.j1YoGTHwCQBKGi.EVPyr/UN3tdWP/Mu')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Client.create(name:'Live')
#App.create(name:'Live', api_password:'test123', thumbnail_sticker_width:30, thumbnail_sticker_height:30, actual_sticker_width:60, actual_sticker_height:60, percentage_of_revenue:30)
#Artist.create(first_name:'John', last_name:'Smith', percentage_of_revenue:60)

# OnboardingArtist.delete_all
# Admin.delete_all

Artist.delete_all
Pack.delete_all

a1 = Artist.create(first_name:'John',    last_name:'Smith',      percentage_of_revenue: 5.0)
a2 = Artist.create(first_name:'Bob',     last_name:'Jones',      percentage_of_revenue: 2.5)
a3 = Artist.create(first_name:'Mark',    last_name:'McMurphy',   percentage_of_revenue: 10.0)
a4 = Artist.create(first_name:'John',    last_name:'Lennon',     percentage_of_revenue: 50.0)
a5 = Artist.create(first_name:'Melissa', last_name:'Yingling',   percentage_of_revenue: 100.0)

p1 = Pack.create(title:'Awesome Pack',  price: 10.00,  available: true)

a4.packs << p1



# Admin.create(:username=>'admin', :email =>'admin@admin.com', :password=>'admin')


