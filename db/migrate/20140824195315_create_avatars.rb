class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
    	t.text :avatar
    end
  end
end
