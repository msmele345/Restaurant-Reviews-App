# RESTFUL Routing:

get '/restaurants' do
  @restaurants = Restaurant.all 
  erb :"index"
end

#  new restaurant 
get '/restaurants/new' do
  authenticate!
  @restaurant = Restaurant.new
  erb :"/restaurants/new"
end

# create 
post '/restaurants' do
  authenticate!
  @restaurant = Restaurant.new(params[:restaurant])

  if @restaurant.save 
    redirect '/restaurants'
  else 
   @errors = @restaurant.errors.full_messages 
   erb :"restaurants/new"
 end 
end

# show
get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :"/restaurants/show"
end


# edit
get '/restaurants/:id/edit' do
  authenticate!
  @restaurant = Restaurant.find(params[:id])

  authorize!(@restaurant.uploaded_critic)
  erb :"/restaurants/edit"
end


put '/restaurants/:id' do
  authenticate!
  @restaurant = Restaurant.find(params[:id])

  @restaurant.update_attributes(params[:restaurant])
  redirect "/restaurants/#{params[:id]}"
end


post '/restaurants/:id/reviews/new' do 
  @restaurant = Restaurant.find(params[:id])
  @review = Review.new(params[:review])

  @review.critic_id = current_user.id 
  @review.restaurant_id = @restaurant.id

  if @review.save 
     redirect "/restaurants/#{params[:id]}"
  else 
    @errors = @review.errors.full_messages
    redirect '/restaurants'
 end 
end 

# delete a specific thing
delete '/restaurants/:id' do
  authenticate!
  @restaurant = Restaurant.find(params[:id])

  authorize!(@restaurant.uploaded_critic)

  @restaurant.destroy!

  redirect '/restaurants'
end


