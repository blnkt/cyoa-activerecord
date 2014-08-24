class RemoveColumn < ActiveRecord::Migration
  def change
  change_table(:avatars) do |t|
  t.remove :timestamps
  end
  end
end
