class ChangeTable < ActiveRecord::Migration
  change_table :avatars do |t|
    	t.column :timestamps, :integer
    end
end
