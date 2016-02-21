# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b1 = Brewery.create name:"Koff", year:1897
b2 = Brewery.create name:"Malmgard", year:2001
b3 = Brewery.create name:"Weihenstephaner", year:1042

s1 = Style.create name:"Lager", description:"Pale, mild"
s2 = Style.create name:"Pale Ale", description:"Pale, medium"
s3 = Style.create name:"Porter", description:"Dark, strong"
s4 = Style.create name:"Lager", description:"Pale, mild"
s4 = Style.create name:"Weizen", description:"White, fruity wheat beer"

b1.beers.create name:"Iso 3", style_id:1
b1.beers.create name:"Karhu", style_id:1
b1.beers.create name:"Tuplahumala", style_id:1
b2.beers.create name:"Huvila Pale Ale", style_id:2
b2.beers.create name:"X Porter", style_id:3
b3.beers.create name:"Hefeweizen", style_id:4
b3.beers.create name:"Helles", style_id:1
