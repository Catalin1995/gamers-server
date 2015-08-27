ActiveAdmin.register Feed do
permit_params :user_id, :game_id, :hours, :minutes

index do
  selectable_column
  id_column
  column :user_id
  column :game_id
  column :activity
  column :hours
  column :minutes
  actions
end

form do |f|
  f.inputs "Admin Details" do
    f.input :user_id
    f.input :game_id
    f.input :hours
    f.input :minutes
  end
  f.actions
end

end
