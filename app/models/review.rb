class Review < ApplicationRecord
  belongs_to :critic, class_name: "User"
  belongs_to :restaurant

  validates :critic_id, :restaurant_id, :rating, presence: true 
end
