ActiveAdmin.register Chat do

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

permit_params :id, :user, :content, :game_id

# index do
#   selectable_column
#   id_column
#   column :id
#   column :user
#   column :content
#   column :game_id
#   column :created_at
#   actions
# end

filter :id
filter :username
filter :content
filter :game_id
filter :created_at

# form do |f|
#   f.inputs "Admin Details" do
#     f.input :user
#     # f.input :game_id
#     f.input :content
#   end
#   f.actions
# end


end
