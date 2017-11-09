require 'faker'


10.times do 

 user = {:username => Faker::Internet.user_name, :email => Faker::Internet.email, :password => "password"}

 User.create!(user)
	
end

10.times do 
	review = {:critic_id => rand(1..10), :restaurant_id => rand(1..10), :rating => rand(1..5)}

	Review.create!(review)
end 


10.times do 
	restaurant = {:name => Faker::Team.name, :location => Faker::Address.street_address, :cuisine => Faker::Food.dish, :uploaded_critic_id => rand(1..10)}

	Restaurant.create!(restaurant)
end 