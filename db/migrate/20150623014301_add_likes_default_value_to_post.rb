class AddLikesDefaultValueToPost < ActiveRecord::Migration
  def change
    change_column :posts, :likes, :integer, :default => 0
  end
end
