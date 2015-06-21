class AddStapledToUser < ActiveRecord::Migration
  def change
    add_column :users, :stapled, :integer, array: true, default: []
  end
end
