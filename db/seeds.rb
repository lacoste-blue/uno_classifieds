User.create!([
  {email: "sh@uno.edu", password: "123456", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-11-21 00:09:12", last_sign_in_at: "2017-11-21 00:09:12", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", phone_number: "225", name: "Shane", listing_view_type: "grid", admin: false}
])
Category.create!([
  {name: "Community", description: "Items of interest to the community"},
  {name: "For sale", description: "Items for sale"},
  {name: "Resumes", description: "Resumes of people looking for work"},
  {name: "Events", description: "Events of interest"},
  {name: "Gigs", description: "Gigs wanted and needed"},
  {name: "Housing", description: "Housing available"},
  {name: "Jobs", description: "Jobs looking to fill"},
  {name: "Personals", description: "Situations wanted"},
  {name: "Services", description: "Services wanted and needed"}
])
Listing.create!([
  {title: "d", all_tags: 'epple, beeple', location: "f", description: "g", price: 4.0, category_id: 1, user_id: 1}
])

Picture.create!([
  {image_file_name: "test3.jpg", image_content_type: "image/jpeg", image_file_size: 45941, image_updated_at: "2017-11-21 00:09:50", listing_id: 7},
  {image_file_name: "test4.jpg", image_content_type: "image/jpeg", image_file_size: 138724, image_updated_at: "2017-11-21 00:09:50", listing_id: 7},
  {image_file_name: "test5.jpg", image_content_type: "image/jpeg", image_file_size: 14679, image_updated_at: "2017-11-21 00:09:50", listing_id: 7}
])
