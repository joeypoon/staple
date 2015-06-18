class AddUrlAndNotesToPost < ActiveRecord::Migration
  def change
    add_column :posts, :url, :string
    add_column :posts, :notes, :text
  end
end
