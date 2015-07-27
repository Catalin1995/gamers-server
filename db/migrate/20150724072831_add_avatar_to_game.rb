class AddAvatarToGame < ActiveRecord::Migration
  def change
    add_column :games, :avatar, :string
  end
end
