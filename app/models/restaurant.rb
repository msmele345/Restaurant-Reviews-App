class Restaurant < ApplicationRecord

  belongs_to :uploaded_critic, class_name: "User"
  has_many :reviews
  has_many :critics, through: :reviews

  validates :name, :location, presence: true 

end
