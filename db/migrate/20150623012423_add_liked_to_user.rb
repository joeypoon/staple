class AddLikedToUser < ActiveRecord::Migration
  def change
    add_column :users, :liked, :integer, array: true, default: []
  end
end
