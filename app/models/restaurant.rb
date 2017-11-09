class Restaurant < ApplicationRecord

  belongs_to :uploaded_critic, class_name: "User"
  has_many :reviews
  has_many :critics, through: :reviews

  validates :name, :location, presence: true 

  def get_ratings
  	self.reviews.pluck(:rating)
  end 

  def average_rating
  	get_ratings.reduce {|rating, num| rating + num } / get_ratings.length
  end 

end
