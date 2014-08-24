class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :hashed_password
    	t.belongs_to :avatar
    	t.text :bio
    	t.string :fave
    end
  end
end
