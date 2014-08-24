class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.belongs_to :user
    end
  end
end
