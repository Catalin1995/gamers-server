ActiveAdmin.register Game do
  permit_params :category, :name, :avatar, :remote_avatar_url

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :avatar
    actions
  end
end
