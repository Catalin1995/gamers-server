class CreateGlobalchats < ActiveRecord::Migration
  def change
    create_table :globalchats do |t|
      t.integer :user_id
      t.string :content
      t.string :user_name

      t.timestamps null: false
    end
  end
end
