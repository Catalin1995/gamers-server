class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :hours
      t.integer :minutes
      t.string :activity
      t.integer :user_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
 
