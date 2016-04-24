Paw.destroy_all
Paw.create(
  name: "Ollie", 
  image: "https://blog-photos.dogvacay.com/blog/wp-content/uploads/2015/06/ShihTzu-3.jpg.pagespeed.ce_.vPmikh8fG7.jpg", 
  gender: "Female", 
  breed: "ShihTzu", 
  weight: 18, 
  color: "cream/white", 
  age: "3", 
  description: "Friendly lap dog, enjoys trotting on the beach", 
  special_needs: false, 
  energy_level: 3, 
  needs_yard: true, 
  kids_ok: false, 
  fees: 75
)
Paw.create(
  name: "Ancho", 
  image: "https://rufusontheweb.files.wordpress.com/2012/01/img_0392.jpg", 
  gender: "Male", 
  breed: "Dachshund", 
  weight: 14, 
  color: "tan", 
  age: "5", 
  description: "Has an affection for couch cushions and traveling in large purses", 
  special_needs: true, 
  energy_level: 2, 
  needs_yard: false, 
  kids_ok: false, 
  fees: 75
)
Paw.create(
  name: "Lady", 
  image: "https://pbs.twimg.com/profile_images/639599645925076994/7Egv8qXQ.jpg", 
  gender: "Female", 
  breed: "Husky", 
  weight: 40, 
  color: "black/white", 
  age: "4", 
  description: "Enjoys swimming, gets excited for taco night.", 
  special_needs: false, 
  energy_level: 5, 
  needs_yard: true, 
  kids_ok: true, 
  fees: 75
)
Paw.create(
  name: "Hugo", 
  image: "https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/How-did-pit-bulls-get-a-bad-rap.jpg?itok=tSr5xB4L", 
  gender: "Male", 
  breed: "Pitbull mix", 
  weight: 55, 
  color: "brown", 
  age: "3", 
  description: "Likes to chase frisbee's and snack on cheetos.", 
  special_needs: false, 
  energy_level: 4, 
  needs_yard: true, 
  kids_ok: true, 
  fees: 75
)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
