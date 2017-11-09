class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change

  	create_table :restaurants do |t|

  	t.string :name, null: false 
  	t.string :location, null: false 
  	t.string :cuisine
  	t.references :uploaded_critic

  	t.timestamps
   end 
  end
end
