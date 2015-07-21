ActiveAdmin.register Feed do
permit_params :user_id, :game_id, :hours, :minutes
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

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