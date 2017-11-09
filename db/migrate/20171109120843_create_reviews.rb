class CreateReviews < ActiveRecord::Migration[5.1]
  def change
  	create_table :reviews do |t|

  	t.references :restaurant, null: false 
  	t.references :critic, null: false 
  	t.integer :rating, null: false 
  	t.string :comments, null: false, :limit => 280

  	t.timestamps
   end 
  end
end
