# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Beer.delete_all
Location.delete_all

Beer.create!(name:'Bud Light', brewery:'A-B', style:'Light Lager', abv: 4.2)
Beer.create!(name:'Heineken', brewery:'Heineken N.V.', style:'Euro Pale Lager', abv: 5.0)
Beer.create!(name:'Yuengling', brewery:'Yuengling', style:'American Amber', abv: 4.4)
Beer.create!(name:'White Rascal', brewery:'Avery Brewing Company', style:'Wheat', abv: 5.6)
Beer.create!(name:'Levity Amber Ale', brewery:'Odell Brewing Company', style:'Amber Ale', abv: 5.1)
Beer.create!(name:'Grey Lady', brewery:'Cisco Brewers', style:'Witbier', abv: 4.5)


Location.create!(name:'Luckys Lounge', address:'355 Congress Street Boston, MA 02210')
Location.create!(name:'Atlantic Beer Garden', address:'383 Congress Street Boston, MA 02110')
Location.create!(name:'Trade', address:'540 Atlantic Ave Boston, MA 02110')
Location.create!(name:'Blue Dragon', address:'324 A Street Boston, MA 02210')
